// Evolution Protocol Performance Benchmark
//
// Validates evolution protocol performance against targets:
// - Socket message latency: < 10ms (target: <10ms overhead)
// - Neural state serialization: < 100µs
// - Token message serialization: < 50µs
// - Batch message throughput: > 100k messages/second
// - Visual feedback latency: < 5ms

use criterion::{black_box, criterion_group, criterion_main, Criterion, Throughput};
use serde::{Deserialize, Serialize};

/// Neural state message from evolution daemon
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralStateMessage {
    pub timestamp: f64,
    pub resonance: f32,
    pub activity_level: f32,
    pub entropy: f32,
    pub coherence: f32,
    pub dominant_frequency: f32,
    pub territory_id: u32,
}

/// Token message for visual feedback
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TokenMessage {
    pub token: String,
    pub token_id: u64,
    pub probability: f32,
    pub position: u32,
    pub timestamp: f64,
}

/// Visual feedback message to evolution daemon
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VisualFeedbackMessage {
    pub tile_id: u32,
    pub glow_intensity: f32,
    pub resonance_match: f32,
    pub timestamp: f64,
}

/// Evolution protocol message wrapper
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum EvolutionMessage {
    NeuralState(NeuralStateMessage),
    Token(TokenMessage),
    VisualFeedback(VisualFeedbackMessage),
    Batch(Vec<NeuralStateMessage>),
    Heartbeat(f64),
}

// ============================================
// Serialization Benchmarks
// ============================================

/// Benchmark neural state serialization
fn bench_neural_state_serde(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_neural_state");

    let state = NeuralStateMessage {
        timestamp: 1234567890.123,
        resonance: 0.85,
        activity_level: 0.72,
        entropy: 0.45,
        coherence: 0.91,
        dominant_frequency: 12.5,
        territory_id: 42,
    };

    group.bench_function("serialize_json", |b| {
        b.iter(|| {
            let json = serde_json::to_string(&state).unwrap();
            black_box(json);
        });
    });

    group.bench_function("deserialize_json", |b| {
        let json = serde_json::to_string(&state).unwrap();
        b.iter(|| {
            let decoded: NeuralStateMessage = serde_json::from_str(&json).unwrap();
            black_box(decoded);
        });
    });

    // Bincode comparison (more efficient)
    group.bench_function("serialize_bincode", |b| {
        b.iter(|| {
            let bytes = bincode::serialize(&state).unwrap();
            black_box(bytes);
        });
    });

    group.bench_function("deserialize_bincode", |b| {
        let bytes = bincode::serialize(&state).unwrap();
        b.iter(|| {
            let decoded: NeuralStateMessage = bincode::deserialize(&bytes).unwrap();
            black_box(decoded);
        });
    });

    group.finish();
}

/// Benchmark token message serialization
fn bench_token_message_serde(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_token_message");

    let token = TokenMessage {
        token: "Hello".to_string(),
        token_id: 12345,
        probability: 0.95,
        position: 42,
        timestamp: 1234567890.0,
    };

    group.bench_function("serialize_json", |b| {
        b.iter(|| {
            let json = serde_json::to_string(&token).unwrap();
            black_box(json);
        });
    });

    group.bench_function("deserialize_json", |b| {
        let json = serde_json::to_string(&token).unwrap();
        b.iter(|| {
            let decoded: TokenMessage = serde_json::from_str(&json).unwrap();
            black_box(decoded);
        });
    });

    // Long token (simulates generated text)
    let long_token = TokenMessage {
        token: "This is a much longer token sequence that represents typical LLM output".to_string(),
        token_id: 99999,
        probability: 0.78,
        position: 1024,
        timestamp: 1234567890.0,
    };

    group.bench_function("serialize_long_json", |b| {
        b.iter(|| {
            let json = serde_json::to_string(&long_token).unwrap();
            black_box(json);
        });
    });

    group.finish();
}

/// Benchmark visual feedback serialization
fn bench_visual_feedback_serde(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_visual_feedback");

    let feedback = VisualFeedbackMessage {
        tile_id: 123,
        glow_intensity: 0.75,
        resonance_match: 0.92,
        timestamp: 1234567890.0,
    };

    group.throughput(Throughput::Elements(1000));
    group.bench_function("serialize_1k", |b| {
        b.iter(|| {
            let mut results = Vec::with_capacity(1000);
            for i in 0..1000 {
                let msg = VisualFeedbackMessage {
                    tile_id: i,
                    ..feedback.clone()
                };
                results.push(serde_json::to_string(&msg).unwrap());
            }
            black_box(results);
        });
    });

    group.bench_function("deserialize_1k", |b| {
        let jsons: Vec<String> = (0..1000)
            .map(|i| {
                let msg = VisualFeedbackMessage {
                    tile_id: i,
                    ..feedback.clone()
                };
                serde_json::to_string(&msg).unwrap()
            })
            .collect();

        b.iter(|| {
            let results: Vec<VisualFeedbackMessage> = jsons
                .iter()
                .map(|j| serde_json::from_str(j).unwrap())
                .collect();
            black_box(results);
        });
    });

    group.finish();
}

/// Benchmark message wrapper serialization
fn bench_message_wrapper(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_wrapper");

    let messages = vec![
        EvolutionMessage::NeuralState(NeuralStateMessage {
            timestamp: 0.0,
            resonance: 0.5,
            activity_level: 0.5,
            entropy: 0.5,
            coherence: 0.5,
            dominant_frequency: 10.0,
            territory_id: 0,
        }),
        EvolutionMessage::Token(TokenMessage {
            token: "test".to_string(),
            token_id: 0,
            probability: 1.0,
            position: 0,
            timestamp: 0.0,
        }),
        EvolutionMessage::VisualFeedback(VisualFeedbackMessage {
            tile_id: 0,
            glow_intensity: 1.0,
            resonance_match: 1.0,
            timestamp: 0.0,
        }),
        EvolutionMessage::Heartbeat(0.0),
    ];

    for (name, msg) in [
        ("neural_state", &messages[0]),
        ("token", &messages[1]),
        ("visual_feedback", &messages[2]),
        ("heartbeat", &messages[3]),
    ] {
        group.bench_function(format!("serialize_{}", name), |b| {
            b.iter(|| {
                let json = serde_json::to_string(msg).unwrap();
                black_box(json);
            });
        });
    }

    // Batch message
    let batch_states: Vec<NeuralStateMessage> = (0..100)
        .map(|i| NeuralStateMessage {
            timestamp: i as f64,
            resonance: i as f32 / 100.0,
            activity_level: 0.5,
            entropy: 0.5,
            coherence: 0.5,
            dominant_frequency: 10.0,
            territory_id: i,
        })
        .collect();

    let batch_msg = EvolutionMessage::Batch(batch_states);

    group.bench_function("serialize_batch_100", |b| {
        b.iter(|| {
            let json = serde_json::to_string(&batch_msg).unwrap();
            black_box(json);
        });
    });

    group.finish();
}

// ============================================
// Protocol Parsing Benchmarks
// ============================================

/// Benchmark protocol message parsing
fn bench_protocol_parsing(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_parsing");

    // Simulate parsing raw socket data
    let raw_neural = br#"{"timestamp":1234567890.0,"resonance":0.85,"activity_level":0.72,"entropy":0.45,"coherence":0.91,"dominant_frequency":12.5,"territory_id":42}"#;

    let raw_token = br#"{"token":"Hello","token_id":12345,"probability":0.95,"position":42,"timestamp":1234567890.0}"#;

    group.bench_function("parse_neural_from_bytes", |b| {
        b.iter(|| {
            let decoded: NeuralStateMessage = serde_json::from_slice(raw_neural).unwrap();
            black_box(decoded);
        });
    });

    group.bench_function("parse_token_from_bytes", |b| {
        b.iter(|| {
            let decoded: TokenMessage = serde_json::from_slice(raw_token).unwrap();
            black_box(decoded);
        });
    });

    // Simulate streaming parser (newline-delimited JSON)
    let stream_data: Vec<u8> = (0..100)
        .flat_map(|i| {
            let msg = NeuralStateMessage {
                timestamp: i as f64,
                resonance: i as f32 / 100.0,
                activity_level: 0.5,
                entropy: 0.5,
                coherence: 0.5,
                dominant_frequency: 10.0,
                territory_id: i,
            };
            let mut json = serde_json::to_vec(&msg).unwrap();
            json.push(b'\n');
            json
        })
        .collect();

    group.throughput(Throughput::Elements(100));
    group.bench_function("parse_stream_100", |b| {
        b.iter(|| {
            let mut messages = Vec::new();
            for line in stream_data.split(|&b| b == b'\n') {
                if !line.is_empty() {
                    let msg: NeuralStateMessage = serde_json::from_slice(line).unwrap();
                    messages.push(msg);
                }
            }
            black_box(messages);
        });
    });

    group.finish();
}

// ============================================
// Throughput Benchmarks
// ============================================

/// Benchmark message throughput
fn bench_throughput(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_throughput");

    // Generate test messages
    let neural_states: Vec<NeuralStateMessage> = (0..10000)
        .map(|i| NeuralStateMessage {
            timestamp: i as f64,
            resonance: (i % 100) as f32 / 100.0,
            activity_level: ((i + 50) % 100) as f32 / 100.0,
            entropy: ((i + 25) % 100) as f32 / 100.0,
            coherence: ((i + 75) % 100) as f32 / 100.0,
            dominant_frequency: 10.0 + (i % 10) as f32,
            territory_id: i % 256,
        })
        .collect();

    group.throughput(Throughput::Elements(10000));

    // Serialize throughput
    group.bench_function("serialize_10k_json", |b| {
        b.iter(|| {
            let serialized: Vec<Vec<u8>> = neural_states
                .iter()
                .map(|s| serde_json::to_vec(s).unwrap())
                .collect();
            black_box(serialized);
        });
    });

    group.bench_function("serialize_10k_bincode", |b| {
        b.iter(|| {
            let serialized: Vec<Vec<u8>> = neural_states
                .iter()
                .map(|s| bincode::serialize(s).unwrap())
                .collect();
            black_box(serialized);
        });
    });

    // Pre-serialize for deserialization benchmark
    let serialized_json: Vec<Vec<u8>> = neural_states
        .iter()
        .map(|s| serde_json::to_vec(s).unwrap())
        .collect();

    let serialized_bincode: Vec<Vec<u8>> = neural_states
        .iter()
        .map(|s| bincode::serialize(s).unwrap())
        .collect();

    group.bench_function("deserialize_10k_json", |b| {
        b.iter(|| {
            let decoded: Vec<NeuralStateMessage> = serialized_json
                .iter()
                .map(|s| serde_json::from_slice(s).unwrap())
                .collect();
            black_box(decoded);
        });
    });

    group.bench_function("deserialize_10k_bincode", |b| {
        b.iter(|| {
            let decoded: Vec<NeuralStateMessage> = serialized_bincode
                .iter()
                .map(|s| bincode::deserialize(s).unwrap())
                .collect();
            black_box(decoded);
        });
    });

    group.finish();
}

// ============================================
// Memory Efficiency Benchmarks
// ============================================

/// Benchmark memory allocation patterns
fn bench_memory_efficiency(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_memory");

    // Reuse buffer vs allocate fresh
    let state = NeuralStateMessage {
        timestamp: 0.0,
        resonance: 0.5,
        activity_level: 0.5,
        entropy: 0.5,
        coherence: 0.5,
        dominant_frequency: 10.0,
        territory_id: 0,
    };

    group.bench_function("serialize_reuse_buffer", |b| {
        let mut buffer = Vec::with_capacity(256);
        b.iter(|| {
            buffer.clear();
            serde_json::to_writer(&mut buffer, &state).unwrap();
            black_box(&buffer);
        });
    });

    group.bench_function("serialize_fresh_buffer", |b| {
        b.iter(|| {
            let buffer = serde_json::to_vec(&state).unwrap();
            black_box(buffer);
        });
    });

    // Pool-based message allocation
    group.bench_function("message_pool", |b| {
        let mut pool: Vec<NeuralStateMessage> = (0..100)
            .map(|_| state.clone())
            .collect();

        b.iter(|| {
            // Simulate pool usage
            for msg in &mut pool {
                msg.timestamp += 1.0;
                msg.resonance = (msg.resonance + 0.01).min(1.0);
            }
            black_box(&pool);
        });
    });

    group.finish();
}

// ============================================
// Realistic Workload Benchmarks
// ============================================

/// Benchmark realistic evolution daemon workload
fn bench_realistic_workload(c: &mut Criterion) {
    let mut group = c.benchmark_group("evo_workload");

    // Simulate one frame of evolution daemon communication
    group.bench_function("frame_communication", |b| {
        b.iter(|| {
            // Receive neural state
            let neural = NeuralStateMessage {
                timestamp: 0.0,
                resonance: 0.85,
                activity_level: 0.72,
                entropy: 0.45,
                coherence: 0.91,
                dominant_frequency: 12.5,
                territory_id: 42,
            };
            let neural_json = serde_json::to_vec(&neural).unwrap();
            let _: NeuralStateMessage = serde_json::from_slice(&neural_json).unwrap();

            // Send visual feedback
            let feedback = VisualFeedbackMessage {
                tile_id: 42,
                glow_intensity: 0.75,
                resonance_match: 0.92,
                timestamp: 0.0,
            };
            let feedback_json = serde_json::to_vec(&feedback).unwrap();
            let _: VisualFeedbackMessage = serde_json::from_slice(&feedback_json).unwrap();

            // Process token (if any)
            let token = TokenMessage {
                token: "test".to_string(),
                token_id: 0,
                probability: 0.95,
                position: 0,
                timestamp: 0.0,
            };
            let token_json = serde_json::to_vec(&token).unwrap();
            let _: TokenMessage = serde_json::from_slice(&token_json).unwrap();

            black_box((neural_json, feedback_json, token_json));
        });
    });

    // Simulate high-frequency neural state updates (60 FPS)
    group.throughput(Throughput::Elements(60));
    group.bench_function("60fps_neural_states", |b| {
        let states: Vec<NeuralStateMessage> = (0..60)
            .map(|i| NeuralStateMessage {
                timestamp: i as f64 / 60.0,
                resonance: 0.5 + (i as f32 / 120.0),
                activity_level: 0.5,
                entropy: 0.5,
                coherence: 0.5,
                dominant_frequency: 10.0,
                territory_id: 0,
            })
            .collect();

        b.iter(|| {
            let serialized: Vec<Vec<u8>> = states
                .iter()
                .map(|s| serde_json::to_vec(s).unwrap())
                .collect();
            let deserialized: Vec<NeuralStateMessage> = serialized
                .iter()
                .map(|s| serde_json::from_slice(s).unwrap())
                .collect();
            black_box(deserialized);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_neural_state_serde,
    bench_token_message_serde,
    bench_visual_feedback_serde,
    bench_message_wrapper,
    bench_protocol_parsing,
    bench_throughput,
    bench_memory_efficiency,
    bench_realistic_workload,
);
criterion_main!(benches);
