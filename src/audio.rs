//! Host-side audio driver for Geometry OS.
//!
//! Reads the VM's memory-mapped audio registers (0xFFC0–0xFFC3) and produces
//! a square wave tone using `rodio` (when the `audio` feature is enabled).
//! When compiled without the feature, provides a no-op fallback so the rest
//! of the system compiles on any platform.

#[cfg(feature = "audio")]
mod imp {
    use rodio::{OutputStream, Sink, Source};
    use std::time::Duration;

    const SAMPLE_RATE: u32 = 44100;

    pub struct AudioDriver {
        _stream: Option<OutputStream>,
        sink: Option<Sink>,
        last_freq: u32,
        last_volume: u32,
    }

    impl AudioDriver {
        pub fn new() -> Self {
            let (stream, handle) = match OutputStream::try_default() {
                Ok(s) => s,
                Err(e) => {
                    eprintln!("[AUDIO] No audio device available: {}", e);
                    return Self {
                        _stream: None,
                        sink: None,
                        last_freq: 0,
                        last_volume: 0,
                    };
                }
            };

            let sink = match Sink::try_new(&handle) {
                Ok(s) => s,
                Err(e) => {
                    eprintln!("[AUDIO] Failed to create audio sink: {}", e);
                    return Self {
                        _stream: None,
                        sink: None,
                        last_freq: 0,
                        last_volume: 0,
                    };
                }
            };

            sink.pause();

            Self {
                _stream: Some(stream),
                sink: Some(sink),
                last_freq: 0,
                last_volume: 0,
            }
        }

        pub fn update(&mut self, freq: u32, volume: u32, _duration_ms: u32, status: u32) {
            let sink = match &self.sink {
                Some(s) => s,
                None => return,
            };

            if status == 0 || freq == 0 {
                if self.last_freq != 0 {
                    sink.clear();
                    sink.pause();
                    self.last_freq = 0;
                    self.last_volume = 0;
                }
                return;
            }

            let vol = (volume.min(255) as f32) / 255.0;

            if freq != self.last_freq || volume.min(255) != self.last_volume {
                sink.clear();
                self.last_freq = freq;
                self.last_volume = volume.min(255);

                let source = SquareWave::new(freq, SAMPLE_RATE);
                sink.set_volume(vol);
                sink.append(source);
                sink.play();
            }
        }
    }

    struct SquareWave {
        freq: u32,
        sample_rate: u32,
        current_sample: usize,
    }

    impl SquareWave {
        fn new(freq: u32, sample_rate: u32) -> Self {
            Self {
                freq,
                sample_rate,
                current_sample: 0,
            }
        }
    }

    impl Iterator for SquareWave {
        type Item = f32;

        fn next(&mut self) -> Option<Self::Item> {
            self.current_sample += 1;
            let samples_per_cycle = self.sample_rate as f32 / self.freq as f32;
            let phase = (self.current_sample as f32) % samples_per_cycle;
            if phase < samples_per_cycle / 2.0 {
                Some(1.0)
            } else {
                Some(-1.0)
            }
        }
    }

    impl Source for SquareWave {
        fn current_frame_len(&self) -> Option<usize> {
            None
        }
        fn channels(&self) -> u16 {
            1
        }
        fn sample_rate(&self) -> u32 {
            self.sample_rate
        }
        fn total_duration(&self) -> Option<Duration> {
            None
        }
    }
}

#[cfg(not(feature = "audio"))]
mod imp {
    /// No-op audio driver when compiled without the `audio` feature.
    /// The VM audio registers still work; sound just doesn't play.
    pub struct AudioDriver;

    impl AudioDriver {
        pub fn new() -> Self {
            Self
        }

        pub fn update(&mut self, _freq: u32, _volume: u32, _duration_ms: u32, _status: u32) {
            // No-op: audio registers are still read/writable by VM programs,
            // but no sound is produced.
        }
    }
}

pub use imp::AudioDriver;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_audio_driver_new() {
        let _driver = AudioDriver::new();
    }

    #[test]
    fn test_audio_driver_update_silence() {
        let mut driver = AudioDriver::new();
        driver.update(0, 0, 0, 0);
        driver.update(440, 128, 100, 0);
    }

    #[test]
    fn test_audio_driver_update_play() {
        let mut driver = AudioDriver::new();
        driver.update(440, 200, 0, 1);
        driver.update(0, 0, 0, 0);
    }

    #[test]
    fn test_audio_driver_freq_change() {
        let mut driver = AudioDriver::new();
        driver.update(262, 128, 0, 1); // C4
        driver.update(330, 128, 0, 1); // E4
        driver.update(392, 128, 0, 1); // G4
        driver.update(0, 0, 0, 0);     // stop
    }
}
