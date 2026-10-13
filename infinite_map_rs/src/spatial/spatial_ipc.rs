// Spatial IPC System - Pipe-based communication with security validation
use crate::geoasm_materializer::CellState;
use std::sync::Arc;
use std::collections::HashMap;

pub struct Pipe {
    pub pipe_id: u32,
    pub buffer: Vec<u8>,
    pub capacity: usize,
    pub read_pos: usize,
    pub write_pos: usize,
    pub readers: Vec<u32>,  // PIDs with read permission
    pub writers: Vec<u32>,  // PIDs with write permission
}

impl Pipe {
    pub fn new(pipe_id: u32, capacity: usize) -> Self {
        Pipe {
            pipe_id,
            buffer: vec![0; capacity],
            capacity,
            read_pos: 0,
            write_pos: 0,
            readers: Vec::new(),
            writers: Vec::new(),
        }
    }

    pub fn write(&mut self, data: &[u8]) -> Result<usize, String> {
        let mut written = 0;
        for &byte in data {
            if self.write_pos >= self.capacity {
                break; // Buffer full
            }
            self.buffer[self.write_pos] = byte;
            self.write_pos += 1;
            written += 1;
        }
        Ok(written)
    }

    pub fn read(&mut self, buf: &mut [u8]) -> Result<usize, String> {
        let mut read_count = 0;
        for byte in buf.iter_mut() {
            if self.read_pos >= self.write_pos {
                break; // No more data
            }
            *byte = self.buffer[self.read_pos];
            self.read_pos += 1;
            read_count += 1;
        }
        Ok(read_count)
    }

    pub fn available(&self) -> usize {
        if self.write_pos >= self.read_pos {
            self.write_pos - self.read_pos
        } else {
            0
        }
    }

    pub fn grant_read(&mut self, pid: u32) {
        if !self.readers.contains(&pid) {
            self.readers.push(pid);
        }
    }

    pub fn grant_write(&mut self, pid: u32) {
        if !self.writers.contains(&pid) {
            self.writers.push(pid);
        }
    }

    pub fn can_read(&self, pid: u32) -> bool {
        self.readers.contains(&pid)
    }

    pub fn can_write(&self, pid: u32) -> bool {
        self.writers.contains(&pid)
    }
}

pub struct SpatialIpc {
    pub pipes: HashMap<u32, Pipe>,
    pub next_pipe_id: u32,
}

impl SpatialIpc {
    pub fn new() -> Self {
        SpatialIpc {
            pipes: HashMap::new(),
            next_pipe_id: 1,
        }
    }

    pub fn create_pipe(&mut self, capacity: usize) -> Result<u32, String> {
        let pipe_id = self.next_pipe_id;
        self.next_pipe_id += 1;

        let pipe = Pipe::new(pipe_id, capacity);
        self.pipes.insert(pipe_id, pipe);

        Ok(pipe_id)
    }

    pub fn get_pipe(&mut self, pipe_id: u32) -> Option<&mut Pipe> {
        self.pipes.get_mut(&pipe_id)
    }

    pub fn grant_pipe_access(&mut self, pipe_id: u32, pid: u32, can_read: bool, can_write: bool) -> Result<(), String> {
        let pipe = self.pipes.get_mut(&pipe_id)
            .ok_or(format!("Pipe {} not found", pipe_id))?;

        if can_read {
            pipe.grant_read(pid);
        }
        if can_write {
            pipe.grant_write(pid);
        }

        Ok(())
    }

    pub fn pipe_write(&mut self, pipe_id: u32, pid: u32, data: &[u8]) -> Result<usize, String> {
        let pipe = self.pipes.get_mut(&pipe_id)
            .ok_or(format!("Pipe {} not found", pipe_id))?;

        if !pipe.can_write(pid) {
            return Err(format!("PID {} denied write access to pipe {}", pid, pipe_id));
        }

        pipe.write(data)
    }

    pub fn pipe_read(&mut self, pipe_id: u32, pid: u32, buf: &mut [u8]) -> Result<usize, String> {
        let pipe = self.pipes.get_mut(&pipe_id)
            .ok_or(format!("Pipe {} not found", pipe_id))?;

        if !pipe.can_read(pid) {
            return Err(format!("PID {} denied read access to pipe {}", pid, pipe_id));
        }

        pipe.read(buf)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pipe_creation() {
        let mut ipc = SpatialIpc::new();
        let pipe_id = ipc.create_pipe(256).unwrap();
        assert_eq!(pipe_id, 1);
        assert!(ipc.pipes.contains_key(&pipe_id));
    }

    #[test]
    fn test_pipe_write_read() {
        let mut ipc = SpatialIpc::new();
        let pipe_id = ipc.create_pipe(256).unwrap();

        ipc.grant_pipe_access(pipe_id, 1, false, true).unwrap();
        ipc.grant_pipe_access(pipe_id, 2, true, false).unwrap();

        let data = b"Hello, World!";
        ipc.pipe_write(pipe_id, 1, data).unwrap();

        let mut buf = [0u8; 32];
        let n = ipc.pipe_read(pipe_id, 2, &mut buf).unwrap();
        assert_eq!(n, data.len());
        assert_eq!(&buf[..n], data);
    }

    #[test]
    fn test_pipe_permissions() {
        let mut ipc = SpatialIpc::new();
        let pipe_id = ipc.create_pipe(256).unwrap();

        // PID 1 can write
        ipc.grant_pipe_access(pipe_id, 1, false, true).unwrap();

        // PID 2 can read
        ipc.grant_pipe_access(pipe_id, 2, true, false).unwrap();

        // Try to write without permission
        let result = ipc.pipe_write(pipe_id, 2, b"test");
        assert!(result.is_err());

        // Try to read without permission
        let mut buf = [0u8; 4];
        let result = ipc.pipe_read(pipe_id, 1, &mut buf);
        assert!(result.is_err());
    }

    #[test]
    fn test_pipe_capacity() {
        let mut ipc = SpatialIpc::new();
        let pipe_id = ipc.create_pipe(16).unwrap();

        ipc.grant_pipe_access(pipe_id, 1, false, true).unwrap();

        // Write exactly 16 bytes
        ipc.pipe_write(pipe_id, 1, &vec![0xAA; 16]).unwrap();

        // Try to write more (should fail or write 0)
        let result = ipc.pipe_write(pipe_id, 1, &[0xBB]);
        assert_eq!(result.unwrap(), 0);
    }
}