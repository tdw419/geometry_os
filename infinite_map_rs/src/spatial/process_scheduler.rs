// Process Scheduler Implementation
use crate::geoasm_materializer::CellState;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ProcessState {
    Ready,
    Running,
    Blocked,
    Terminated,
}

#[derive(Debug, Clone)]
pub struct ProcessControlBlock {
    pub pid: u32,
    pub state: ProcessState,
    pub pc: u32,
    pub sp: u32,
    pub registers: [u32; 32],
    pub time_slice: u32,
    pub ticks_used: u32,
    pub region: ProcessRegion,
    pub base_index: usize,
}

#[derive(Debug, Clone)]
pub struct ProcessRegion {
    pub start_x: usize,
    pub start_y: usize,
    pub width: usize,
    pub height: usize,
}

impl ProcessRegion {
    pub fn new(start_x: usize, start_y: usize, width: usize, height: usize) -> Self {
        ProcessRegion {
            start_x,
            start_y,
            width,
            height,
        }
    }
}

#[derive(Debug, Clone)]
pub struct ProcessScheduler {
    pub pcbs: Vec<ProcessControlBlock>,
    pub ready_queue: std::collections::VecDeque<u32>,
    pub current_pid: Option<u32>,
    pub next_pid: u32,
    pub time_slice: u32,
    pub grid_w: u32,
    pub grid_h: u32,
}

impl ProcessRegion {
    /// Exclusive end X (start_x + width)
    pub fn width(&self) -> usize {
        self.width
    }

    /// Exclusive end Y (start_y + height)
    pub fn height(&self) -> usize {
        self.height
    }
}

impl ProcessScheduler {
    /// Get a process by PID (immutable)
    pub fn get_process(&self, pid: u32) -> Option<&ProcessControlBlock> {
        self.pcbs.iter().find(|p| p.pid == pid)
    }

    /// Get a process by PID (mutable)
    pub fn get_process_mut(&mut self, pid: u32) -> Option<&mut ProcessControlBlock> {
        self.pcbs.iter_mut().find(|p| p.pid == pid)
    }

    /// Number of processes known to the scheduler
    pub fn process_count(&self) -> usize {
        self.pcbs.len()
    }

    pub fn new(grid_w: u32, grid_h: u32) -> Self {
        ProcessScheduler {
            pcbs: Vec::new(),
            ready_queue: std::collections::VecDeque::new(),
            current_pid: None,
            next_pid: 1,
            time_slice: 1000,
            grid_w,
            grid_h,
        }
    }

    pub fn create_process(&mut self, region: ProcessRegion, entry_point: u32) -> u32 {
        let pid = self.next_pid;
        self.next_pid += 1;

        let base_index = region.start_y * (self.grid_w as usize) + region.start_x;

        let pcb = ProcessControlBlock {
            pid,
            state: ProcessState::Ready,
            pc: entry_point,
            sp: 0,
            registers: [0; 32],
            time_slice: self.time_slice,
            ticks_used: 0,
            region,
            base_index,
        };

        self.pcbs.push(pcb);
        self.ready_queue.push_back(pid);
        pid
    }

    pub fn tick(&mut self) -> Option<usize> {
        // Simple round-robin scheduler
        let mut switch = false;

        if let Some(pid) = self.current_pid {
            if let Some(pcb) = self.pcbs.iter_mut().find(|p| p.pid == pid) {
                pcb.ticks_used += 1;
                if pcb.ticks_used >= pcb.time_slice {
                    // Time slice expired, switch context
                    pcb.state = ProcessState::Ready;
                    pcb.ticks_used = 0;
                    switch = true;
                }
            }
        } else {
            switch = true;
        }

        if switch {
            if let Some(pid) = self.current_pid {
                self.ready_queue.push_back(pid);
            }
            self.current_pid = self.ready_queue.pop_front();
        }

        if let Some(pid) = self.current_pid {
            if let Some(pcb) = self.pcbs.iter_mut().find(|p| p.pid == pid) {
                pcb.state = ProcessState::Running;
                return Some(pcb.base_index);
            }
        }

        None
    }

    /// Serialize to binary for GridRunner consumption
    ///
    /// Format: 20-byte header (grid_w, grid_h, cell_count, first_code_x,
    /// first_code_y — all u32 LE) followed by 16-byte cell records
    /// (x, y, opcode_or_type, value — all u32 LE). The scheduler owns no
    /// cell raster of its own (walls/membranes are materialized by
    /// GeoAsmMaterializer), so the payload is header-only today.
    pub fn to_binary(&self) -> Vec<u8> {
        let mut out = Vec::with_capacity(20);
        out.extend_from_slice(&self.grid_w.to_le_bytes());
        out.extend_from_slice(&self.grid_h.to_le_bytes());
        out.extend_from_slice(&0u32.to_le_bytes()); // cell_count
        out.extend_from_slice(&0u32.to_le_bytes()); // first_code_x
        out.extend_from_slice(&0u32.to_le_bytes()); // first_code_y
        out
    }
}
