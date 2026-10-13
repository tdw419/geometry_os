//! End-to-End Integration Test for Phase 5.3: GPU-RISC-V Co-Execution
//!
//! This test verifies the complete flow from RISC-V guest hypercall to spatial processing.

use std::sync::Arc;
use wgpu::BufferUsages;

use infinite_map_rs::spatial::hypervisor_bridge::{
    SpatialAllocReq, SpatialAllocResp, SpatialProcessReq, OPCODE_ADD, OPCODE_DIV, OPCODE_MUL,
    OPCODE_SUB, SPATIAL_ALLOC_OK, SPATIAL_PROCESS_ERR_INVALID_REGION,
    SPATIAL_PROCESS_ERR_INVALID_SIZE, SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE, SPATIAL_PROCESS_OK,
};
use infinite_map_rs::spatial_hypervisor_integration::SpatialHypervisorIntegration;

/// Test helper: Create a minimal GPU setup for testing
async fn create_test_gpu() -> (Arc<wgpu::Instance>, Arc<wgpu::Device>, Arc<wgpu::Queue>) {
    let instance = Arc::new(wgpu::Instance::default());
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
        .expect("Failed to find an appropriate adapter");

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .expect("Failed to create device");

    (instance, Arc::new(device), Arc::new(queue))
}

/// Test helper: Create a dummy RAM buffer with test data
fn create_ram_buffer(device: &wgpu::Device, size: u64) -> Arc<wgpu::Buffer> {
    let buffer = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("Test RAM Buffer"),
        size,
        usage: BufferUsages::STORAGE | BufferUsages::COPY_DST | BufferUsages::COPY_SRC,
        mapped_at_creation: false,
    });
    Arc::new(buffer)
}

/// Test helper: Write data to RAM buffer at specific offset
fn write_to_ram(
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    buffer: &wgpu::Buffer,
    offset: u64,
    data: &[u8],
) {
    let staging = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("Staging Buffer"),
        size: data.len() as u64,
        usage: BufferUsages::MAP_WRITE | BufferUsages::COPY_SRC,
        mapped_at_creation: false,
    });

    // Map staging buffer
    let buffer_slice = staging.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    buffer_slice.map_async(wgpu::MapMode::Write, move |res| tx.send(res).unwrap());
    device.poll(wgpu::MaintainBase::Wait);
    rx.recv().unwrap().expect("Failed to map staging buffer");

    // Write data
    {
        let mut mapped = buffer_slice.get_mapped_range_mut();
        mapped.copy_from_slice(data);
    }
    staging.unmap();

    // Copy to RAM buffer
    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("Write to RAM Encoder"),
    });
    encoder.copy_buffer_to_buffer(&staging, 0, buffer, offset, data.len() as u64);
    queue.submit(Some(encoder.finish()));
}

/// Test helper: Read data from RAM buffer at specific offset
fn read_from_ram(
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    buffer: &wgpu::Buffer,
    offset: u64,
    size: u64,
) -> Vec<u8> {
    let staging = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("Read Staging Buffer"),
        size,
        usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    // Copy from RAM to staging
    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("Read from RAM Encoder"),
    });
    encoder.copy_buffer_to_buffer(buffer, offset, &staging, 0, size);
    queue.submit(Some(encoder.finish()));

    // Map staging buffer
    let buffer_slice = staging.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    buffer_slice.map_async(wgpu::MapMode::Read, move |res| tx.send(res).unwrap());
    device.poll(wgpu::MaintainBase::Wait);
    rx.recv()
        .unwrap()
        .expect("Failed to map staging buffer for reading");

    let data = buffer_slice.get_mapped_range().to_vec();
    staging.unmap();

    data
}

/// Test: Complete E2E flow from allocation to processing
#[tokio::test]
async fn test_spatial_coexecution_e2e() {
    // Setup GPU resources
    let (_instance, device, queue) = create_test_gpu().await;

    // Create RAM buffer (1MB)
    let ram_buffer = create_ram_buffer(&device, 1024 * 1024);

    // Create spatial hypervisor integration
    let mut hypervisor =
        SpatialHypervisorIntegration::new(128, 64, ram_buffer.clone(), device, queue.clone());

    // Step 1: Allocate a spatial region
    let alloc_req = SpatialAllocReq {
        req_id: 0,
        width: 10,
        height: 5,
    };

    let alloc_req_bytes = {
        let mut buf = [0u8; 24];
        buf[0..8].copy_from_slice(&alloc_req.req_id.to_le_bytes());
        buf[8..12].copy_from_slice(&alloc_req.width.to_le_bytes());
        buf[12..16].copy_from_slice(&alloc_req.height.to_le_bytes());
        buf
    };

    let alloc_req_ptr = 0x1000;
    let alloc_resp_ptr = 0x2000;

    write_to_ram(
        &device,
        &queue,
        &ram_buffer,
        alloc_req_ptr,
        &alloc_req_bytes,
    );

    // Call allocation hypercall
    let (alloc_result, wall_cells) = hypervisor.handle_spatial_alloc(alloc_req_ptr, alloc_resp_ptr);

    assert_eq!(alloc_result, SPATIAL_ALLOC_OK, "Allocation should succeed");
    assert!(
        !wall_cells.is_empty(),
        "Should have WALL cells around region"
    );

    // Read allocation response
    let alloc_resp_bytes = read_from_ram(&device, &queue, &ram_buffer, alloc_resp_ptr, 24);
    let region_id = u64::from_le_bytes([
        alloc_resp_bytes[0],
        alloc_resp_bytes[1],
        alloc_resp_bytes[2],
        alloc_resp_bytes[3],
        alloc_resp_bytes[4],
        alloc_resp_bytes[5],
        alloc_resp_bytes[6],
        alloc_resp_bytes[7],
    ]);

    assert_eq!(region_id, 1, "First allocation should get region_id=1");

    // Step 2: Prepare input data [10, 20, 30]
    let input_data: Vec<u32> = vec![10, 20, 30];
    let mut input_bytes = Vec::new();
    for word in &input_data {
        input_bytes.extend_from_slice(&word.to_le_bytes());
    }

    let input_ptr = 0x3000;
    let output_ptr = 0x4000;
    let output_size = input_bytes.len() as u32;

    write_to_ram(&device, &queue, &ram_buffer, input_ptr, &input_bytes);

    // Step 3: Submit processing request (MUL opcode = multiply by 2)
    let process_req = SpatialProcessReq {
        req_id: 100,
        input_buffer_ptr: input_ptr,
        input_size: input_bytes.len() as u32,
        output_buffer_ptr: output_ptr,
        output_size,
        region_id: 1, // Use the region we just allocated
        opcode: OPCODE_MUL,
    };

    let process_req_bytes = {
        let mut buf = [0u8; 32];
        buf[0..8].copy_from_slice(&process_req.req_id.to_le_bytes());
        buf[8..12].copy_from_slice(&process_req.input_buffer_ptr.to_le_bytes());
        buf[12..16].copy_from_slice(&process_req.input_size.to_le_bytes());
        buf[16..20].copy_from_slice(&process_req.output_buffer_ptr.to_le_bytes());
        buf[20..24].copy_from_slice(&process_req.output_size.to_le_bytes());
        buf[24..28].copy_from_slice(&process_req.region_id.to_le_bytes());
        buf[28..32].copy_from_slice(&process_req.opcode.to_le_bytes());
        buf
    };

    let process_req_ptr = 0x5000;
    let process_resp_ptr = 0x6000;

    write_to_ram(
        &device,
        &queue,
        &ram_buffer,
        process_req_ptr,
        &process_req_bytes,
    );

    // Call processing hypercall
    let (process_result, words_processed) =
        hypervisor.handle_spatial_process(process_req_ptr, process_resp_ptr);

    assert_eq!(
        process_result, SPATIAL_PROCESS_OK,
        "Processing should succeed"
    );
    assert_eq!(words_processed, 3, "Should process 3 words");

    // Read output data
    let output_bytes =
        read_from_ram(&device, &queue, &ram_buffer, output_ptr.into(), output_size as u64);

    // Parse output words
    let mut output_data = Vec::new();
    for chunk in output_bytes.chunks(4) {
        let mut buf = [0u8; 4];
        buf[..chunk.len()].copy_from_slice(chunk);
        output_data.push(u32::from_le_bytes(buf));
    }

    // Verify: [10, 20, 30] * 2 = [20, 40, 60]
    assert_eq!(output_data, vec![20, 40, 60], "MUL should multiply by 2");
}