// Inter-Tile Communication Primitives - Phase 9.3
//
// Provides communication channels between tiles for concurrent task execution.
// Supports message passing, shared memory, and synchronization primitives.

use super::tile_manager::TileCoord;
use std::collections::{HashMap, VecDeque};
use std::sync::atomic::{AtomicU32, Ordering};
use std::sync::Arc;

/// Inter-tile channel types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ChannelType {
    /// FIFO message queue (send/receive)
    MessageQueue,
    /// Shared memory buffer (read/write)
    SharedBuffer,
}

/// Channel direction
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ChannelDirection {
    Unidirectional,
    Bidirectional,
}

/// Inter-tile channel configuration
#[derive(Debug, Clone)]
pub struct ChannelConfig {
    /// Channel type
    pub channel_type: ChannelType,
    /// Channel direction
    pub direction: ChannelDirection,
    /// Buffer size (in bytes)
    pub buffer_size: usize,
    /// Maximum message size (for message queues)
    pub max_message_size: usize,
}

impl Default for ChannelConfig {
    fn default() -> Self {
        Self {
            channel_type: ChannelType::MessageQueue,
            direction: ChannelDirection::Unidirectional,
            buffer_size: 4096,
            max_message_size: 512,
        }
    }
}

/// Message passing channel
#[derive(Debug)]
pub struct MessageChannel {
    /// Message buffer (FIFO queue)
    messages: VecDeque<Vec<u8>>,
    /// Maximum message size
    max_message_size: usize,
    /// Maximum queue length
    max_queue_length: usize,
    /// Send counter
    send_count: Arc<AtomicU32>,
    /// Receive counter
    receive_count: Arc<AtomicU32>,
}

impl MessageChannel {
    /// Create a new message channel
    pub fn new(max_message_size: usize, max_queue_length: usize) -> Self {
        Self {
            messages: VecDeque::with_capacity(max_queue_length),
            max_message_size,
            max_queue_length,
            send_count: Arc::new(AtomicU32::new(0)),
            receive_count: Arc::new(AtomicU32::new(0)),
        }
    }

    /// Send a message
    pub fn send(&mut self, message: &[u8]) -> Result<(), String> {
        if message.len() > self.max_message_size {
            return Err(format!(
                "Message too large: {} > {}",
                message.len(),
                self.max_message_size
            ));
        }

        if self.messages.len() >= self.max_queue_length {
            return Err("Message queue full".to_string());
        }

        self.messages.push_back(message.to_vec());
        self.send_count.fetch_add(1, Ordering::SeqCst);
        Ok(())
    }

    /// Receive a message
    pub fn receive(&mut self) -> Option<Vec<u8>> {
        if let Some(msg) = self.messages.pop_front() {
            self.receive_count.fetch_add(1, Ordering::SeqCst);
            Some(msg)
        } else {
            None
        }
    }

    /// Check if there are messages available
    pub fn has_messages(&self) -> bool {
        !self.messages.is_empty()
    }

    /// Get message count
    pub fn message_count(&self) -> usize {
        self.messages.len()
    }

    /// Get send count
    pub fn send_count(&self) -> u32 {
        self.send_count.load(Ordering::SeqCst)
    }

    /// Get receive count
    pub fn receive_count(&self) -> u32 {
        self.receive_count.load(Ordering::SeqCst)
    }

    /// Clear all messages
    pub fn clear(&mut self) {
        self.messages.clear();
    }
}

/// Shared memory buffer
#[derive(Debug)]
pub struct SharedBuffer {
    /// Buffer data
    data: Vec<u8>,
    /// Write position
    write_pos: usize,
    /// Buffer size
    size: usize,
}

impl SharedBuffer {
    /// Create a new shared buffer
    pub fn new(size: usize) -> Self {
        Self {
            data: vec![0u8; size],
            write_pos: 0,
            size,
        }
    }

    /// Write data to buffer
    pub fn write(&mut self, offset: usize, data: &[u8]) -> Result<(), String> {
        if offset + data.len() > self.size {
            return Err(format!(
                "Write out of bounds: {} + {} > {}",
                offset,
                data.len(),
                self.size
            ));
        }

        self.data[offset..offset + data.len()].copy_from_slice(data);
        self.write_pos = (self.write_pos).max(offset + data.len());
        Ok(())
    }

    /// Read data from buffer
    pub fn read(&self, offset: usize, len: usize) -> Result<Vec<u8>, String> {
        if offset + len > self.size {
            return Err(format!(
                "Read out of bounds: {} + {} > {}",
                offset,
                len,
                self.size
            ));
        }

        Ok(self.data[offset..offset + len].to_vec())
    }

    /// Get buffer size
    pub fn size(&self) -> usize {
        self.size
    }

    /// Get buffer data
    pub fn data(&self) -> &[u8] {
        &self.data
    }

    /// Clear buffer
    pub fn clear(&mut self) {
        self.data.fill(0);
        self.write_pos = 0;
    }
}

/// Inter-tile channel
pub enum Channel {
    /// Message passing channel
    Message(MessageChannel),
    /// Shared memory buffer
    Shared(SharedBuffer),
}

/// Inter-tile communication error types
#[derive(Debug, thiserror::Error)]
pub enum CommError {
    #[error("Channel not found: {0:?} -> {1:?}")]
    ChannelNotFound(TileCoord, TileCoord),
    #[error("Channel already exists: {0:?} -> {1:?}")]
    ChannelAlreadyExists(TileCoord, TileCoord),
    #[error("Send failed: {0}")]
    SendFailed(String),
    #[error("Receive failed: {0}")]
    ReceiveFailed(String),
    #[error("Invalid operation for channel type")]
    InvalidOperation,
}

/// Inter-tile communication manager
pub struct InterTileComm {
    /// Channels between tiles (from -> (to, channel))
    channels: HashMap<(TileCoord, TileCoord), Channel>,
    /// Channel configurations
    configs: HashMap<(TileCoord, TileCoord), ChannelConfig>,
}

impl InterTileComm {
    /// Create a new inter-tile communication manager
    pub fn new() -> Self {
        Self {
            channels: HashMap::new(),
            configs: HashMap::new(),
        }
    }

    /// Connect two tiles with a channel
    pub fn connect(
        &mut self,
        from: TileCoord,
        to: TileCoord,
        config: ChannelConfig,
    ) -> Result<(), CommError> {
        if self.channels.contains_key(&(from, to)) {
            return Err(CommError::ChannelAlreadyExists(from, to));
        }

        let channel_type = config.channel_type;
        let direction = config.direction;
        let buffer_size = config.buffer_size;
        let max_message_size = config.max_message_size;

        let channel = match channel_type {
            ChannelType::MessageQueue => Channel::Message(MessageChannel::new(
                max_message_size,
                buffer_size / max_message_size.max(1),
            )),
            ChannelType::SharedBuffer => {
                Channel::Shared(SharedBuffer::new(buffer_size))
            }
        };

        self.channels.insert((from, to), channel);
        self.configs.insert((from, to), config);

        // If bidirectional, create reverse channel
        if direction == ChannelDirection::Bidirectional {
            let reverse_config = ChannelConfig {
                channel_type,
                direction: ChannelDirection::Unidirectional,
                buffer_size,
                max_message_size,
            };

            let reverse_channel = match channel_type {
                ChannelType::MessageQueue => Channel::Message(MessageChannel::new(
                    max_message_size,
                    buffer_size / max_message_size.max(1),
                )),
                ChannelType::SharedBuffer => {
                    Channel::Shared(SharedBuffer::new(buffer_size))
                }
            };

            self.channels.insert((to, from), reverse_channel);
            self.configs.insert((to, from), reverse_config);
        }

        Ok(())
    }

    /// Disconnect two tiles
    pub fn disconnect(&mut self, from: TileCoord, to: TileCoord) -> Result<(), CommError> {
        if !self.channels.contains_key(&(from, to)) {
            return Err(CommError::ChannelNotFound(from, to));
        }

        self.channels.remove(&(from, to));
        self.configs.remove(&(from, to));

        // Check if reverse channel exists (bidirectional)
        if self.channels.contains_key(&(to, from)) {
            self.channels.remove(&(to, from));
            self.configs.remove(&(to, from));
        }

        Ok(())
    }

    /// Send a message from one tile to another
    pub fn send_message(
        &mut self,
        from: TileCoord,
        to: TileCoord,
        message: &[u8],
    ) -> Result<(), CommError> {
        if let Some(Channel::Message(channel)) = self.channels.get_mut(&(from, to)) {
            channel
                .send(message)
                .map_err(|e| CommError::SendFailed(e))
        } else {
            Err(CommError::ChannelNotFound(from, to))
        }
    }

    /// Receive a message from one tile to another
    pub fn receive_message(
        &mut self,
        from: TileCoord,
        to: TileCoord,
    ) -> Result<Option<Vec<u8>>, CommError> {
        if let Some(Channel::Message(channel)) = self.channels.get_mut(&(from, to)) {
            Ok(channel.receive())
        } else {
            Err(CommError::ChannelNotFound(from, to))
        }
    }

    /// Check if there are messages available
    pub fn has_messages(&self, from: TileCoord, to: TileCoord) -> Result<bool, CommError> {
        if let Some(Channel::Message(channel)) = self.channels.get(&(from, to)) {
            Ok(channel.has_messages())
        } else {
            Err(CommError::ChannelNotFound(from, to))
        }
    }

    /// Write to shared buffer
    pub fn write_shared(
        &mut self,
        from: TileCoord,
        to: TileCoord,
        offset: usize,
        data: &[u8],
    ) -> Result<(), CommError> {
        if let Some(Channel::Shared(buffer)) = self.channels.get_mut(&(from, to)) {
            buffer
                .write(offset, data)
                .map_err(|e| CommError::SendFailed(e))
        } else {
            Err(CommError::ChannelNotFound(from, to))
        }
    }

    /// Read from shared buffer
    pub fn read_shared(
        &self,
        from: TileCoord,
        to: TileCoord,
        offset: usize,
        len: usize,
    ) -> Result<Vec<u8>, CommError> {
        if let Some(Channel::Shared(buffer)) = self.channels.get(&(from, to)) {
            buffer
                .read(offset, len)
                .map_err(|e| CommError::ReceiveFailed(e))
        } else {
            Err(CommError::ChannelNotFound(from, to))
        }
    }

    /// Get channel configuration
    pub fn get_config(
        &self,
        from: TileCoord,
        to: TileCoord,
    ) -> Result<&ChannelConfig, CommError> {
        self.configs
            .get(&(from, to))
            .ok_or_else(|| CommError::ChannelNotFound(from, to))
    }

    /// Get channel count
    pub fn channel_count(&self) -> usize {
        self.channels.len()
    }

    /// Clear all channels
    pub fn clear(&mut self) {
        self.channels.clear();
        self.configs.clear();
    }
}

impl Default for InterTileComm {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_message_channel_send_receive() {
        let mut channel = MessageChannel::new(512, 10);

        let msg = b"Hello, world!";
        channel.send(msg).unwrap();

        assert!(channel.has_messages());
        assert_eq!(channel.message_count(), 1);
        assert_eq!(channel.send_count(), 1);

        let received = channel.receive().unwrap();
        assert_eq!(received.as_slice(), msg);
        assert_eq!(channel.receive_count(), 1);
        assert!(!channel.has_messages());
    }

    #[test]
    fn test_message_channel_full() {
        let mut channel = MessageChannel::new(512, 2);

        channel.send(b"msg1").unwrap();
        channel.send(b"msg2").unwrap();

        let result = channel.send(b"msg3");
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("full"));
    }

    #[test]
    fn test_shared_buffer_read_write() {
        let mut buffer = SharedBuffer::new(1024);

        let data = b"Test data";
        buffer.write(100, data).unwrap();

        let read_data = buffer.read(100, data.len()).unwrap();
        assert_eq!(read_data.as_slice(), data);
    }

    #[test]
    fn test_shared_buffer_bounds() {
        let mut buffer = SharedBuffer::new(100);

        let result = buffer.write(91, b"1234567890"); // Write past end (91 + 10 = 101 > 100)
        assert!(result.is_err());

        let result = buffer.read(90, 20); // Read past end (90 + 20 = 110 > 100)
        assert!(result.is_err());
    }

    #[test]
    fn test_inter_tile_comm_connect() {
        let mut comm = InterTileComm::new();

        let config = ChannelConfig::default();
        comm.connect((0, 0), (1, 0), config).unwrap();

        assert_eq!(comm.channel_count(), 1);
    }

    #[test]
    fn test_inter_tile_comm_message_passing() {
        let mut comm = InterTileComm::new();

        let config = ChannelConfig::default();
        comm.connect((0, 0), (1, 0), config).unwrap();

        let msg = b"Hello from tile (0,0)";
        comm.send_message((0, 0), (1, 0), msg).unwrap();

        assert!(comm.has_messages((0, 0), (1, 0)).unwrap());

        let received = comm.receive_message((0, 0), (1, 0)).unwrap();
        assert_eq!(received.unwrap().as_slice(), msg);
    }

    #[test]
    fn test_bidirectional_channel() {
        let mut comm = InterTileComm::new();

        let config = ChannelConfig {
            direction: ChannelDirection::Bidirectional,
            ..Default::default()
        };

        comm.connect((0, 0), (1, 0), config).unwrap();

        // Bidirectional creates two channels
        assert_eq!(comm.channel_count(), 2);

        comm.send_message((0, 0), (1, 0), b"msg1").unwrap();
        comm.send_message((1, 0), (0, 0), b"msg2").unwrap();

        let msg1 = comm.receive_message((0, 0), (1, 0)).unwrap().unwrap();
        let msg2 = comm.receive_message((1, 0), (0, 0)).unwrap().unwrap();

        assert_eq!(msg1.as_slice(), b"msg1");
        assert_eq!(msg2.as_slice(), b"msg2");
    }
}