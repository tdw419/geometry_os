// vision_bench.rs -- Vision vs Text accuracy/latency benchmark for Geometry OS

use geometry_os::episode_log;
use geometry_os::hermes;
use geometry_os::vision;
use geometry_os::vm;
use std::time::Instant;

fn main() {
    println!("[vision_bench] Starting Vision vs Text Benchmark");

    let config = hermes::ProviderConfig::load();
    println!("[vision_bench] Using model: {}", config.model);
    if let Some(ref v) = config.vision_model {
        println!("[vision_bench] Using vision model: {}", v);
    } else {
        println!("[vision_bench] WARNING: No vision model configured. Vision calls may fail or use text-only model.");
    }

    let scenarios = vec![
        (
            "healthy-oscillator",
            setup_oscillator as fn(&mut vm::Vm),
            "Is this system healthy? Reply YES or NO and one short reason.",
        ),
        (
            "memory-leak",
            setup_leak as fn(&mut vm::Vm),
            "Is this system healthy? Reply YES or NO and one short reason.",
        ),
        (
            "runaway-process",
            setup_runaway as fn(&mut vm::Vm),
            "Is this system healthy? Reply YES or NO and one short reason.",
        ),
        (
            "stuck-pixel",
            setup_stuck_pixel as fn(&mut vm::Vm),
            "Is this system healthy? Reply YES or NO and one short reason.",
        ),
        (
            "idle-blank",
            setup_blank as fn(&mut vm::Vm),
            "Is this system healthy? Reply YES or NO and one short reason.",
        ),
    ];

    for (name, setup_fn, prompt) in scenarios {
        println!("\n--- Scenario: {} ---", name);
        let mut vm = vm::Vm::new();
        setup_fn(&mut vm);

        // Text modality
        println!("[vision_bench] Calling Text LLM...");
        let text_ctx = hermes::build_hermes_context(&vm, "", &None);
        let text_system = format!(
            "You are a Geometry OS diagnostic assistant.\n\n{}",
            text_ctx
        );

        let start_text = Instant::now();
        let text_response = hermes::call_llm(&config, &text_system, prompt);
        let text_duration = start_text.elapsed();

        // Vision modality
        println!("[vision_bench] Calling Vision LLM...");
        let screen_b64 = vision::encode_png_base64(&vm.screen);
        let vision_system = "You are a Geometry OS diagnostic assistant. You are looking at the 256x256 framebuffer.";

        let start_vision = Instant::now();
        let vision_response = hermes::call_vision_llm(&config, vision_system, prompt, &screen_b64);
        let vision_duration = start_vision.elapsed();

        // Log results
        println!(
            "[text]   latency: {:?}, response: {:?}",
            text_duration,
            text_response.as_deref().unwrap_or("(failed)")
        );
        println!(
            "[vision] latency: {:?}, response: {:?}",
            vision_duration,
            vision_response.as_deref().unwrap_or("(failed)")
        );

        if let Some(tr) = text_response {
            log_bench_result(name, "text", &tr, text_duration.as_secs_f64(), &vm);
        }
        if let Some(vr) = vision_response {
            log_bench_result(name, "vision", &vr, vision_duration.as_secs_f64(), &vm);
        }
    }

    println!("\n[vision_bench] Benchmark complete. Results logged to episodic_memory/");
}

fn log_bench_result(kind: &str, modality: &str, response: &str, _latency: f64, vm: &vm::Vm) {
    let episode = episode_log::build_episode_raw(
        &format!("bench_{}", kind),
        0,
        vec![],
        vm.screen.iter().filter(|&&p| p != 0).count(),
        vm.screen.len(),
        vm.pc,
        vm.halted,
        None,
        Some(kind.to_string()),
        Some(modality.to_string()),
        Some(response.to_string()),
    );
    episode_log::log_episode(&episode);
}

// Scenarios

fn setup_oscillator(vm: &mut vm::Vm) {
    // Draw a 4x4 block that looks like a life oscillator
    for y in 100..102 {
        for x in 100..102 {
            vm.screen[y * 256 + x] = 0x00FFFFFF;
        }
    }
    vm.halted = true;
}

fn setup_leak(vm: &mut vm::Vm) {
    // Large expanding rectangle at the bottom
    for y in 200..250 {
        for x in 50..200 {
            vm.screen[y * 256 + x] = 0x00FF0000;
        }
    }
    vm.halted = false; // Still running
}

fn setup_runaway(vm: &mut vm::Vm) {
    // High instruction count, chaotic screen
    for i in 0..1000 {
        let x = (i * 13) % 256;
        let y = (i * 17) % 256;
        vm.screen[y * 256 + x] = 0x00FFFF00;
    }
    vm.halted = false;
}

fn setup_stuck_pixel(vm: &mut vm::Vm) {
    // Blank except for one bright pixel
    vm.screen[128 * 256 + 128] = 0x00FFFFFF;
    vm.halted = true;
}

fn setup_blank(vm: &mut vm::Vm) {
    // Truly blank
    vm.halted = true;
}
