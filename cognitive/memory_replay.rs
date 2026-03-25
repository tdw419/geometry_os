// memory_replay.rs -> The Reflection Engine
// Phase 18: Memory Replay for idle-cycle reflection

use std::collections::VecDeque;
use std::time::{Duration, Instant};

use crate::memory_compressor::{CompressedAwareness, MemoryArchive};
use crate::neural_mirror::GlyphType;

/// A memory episode for replay analysis
#[derive(Debug, Clone)]
pub struct MemoryEpisode {
    pub tick: u32,
    pub intent: GlyphType,
    pub perception: GlyphType,
    pub was_coherent: bool,
    pub score_at_time: f32,
    pub reflection: Option<String>,
}

/// Result of a reflection session
#[derive(Debug, Clone)]
pub struct ReflectionResult {
    pub episodes_reviewed: usize,
    pub patterns_found: Vec<PatternInsight>,
    pub lessons_learned: Vec<String>,
    pub suggested_adjustments: Vec<String>,
    pub reflection_score: f32,
}

#[derive(Debug, Clone)]
pub struct PatternInsight {
    pub pattern_type: PatternType,
    pub frequency: usize,
    pub description: String,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PatternType {
    RepeatedDissonance,
    CoherenceStreak,
    GlyphConfusion,
    RecoveryPattern,
    DegradingTrend,
    ImprovingTrend,
}

/// The Memory Replay Engine - reflects on past experiences
pub struct MemoryReplay {
    /// Recent episodes for quick access
    recent_episodes: VecDeque<MemoryEpisode>,
    /// Maximum episodes to keep in recent buffer
    max_recent: usize,
    /// Total reflections performed
    reflections_count: u64,
    /// Last reflection time
    last_reflection: Option<Instant>,
    /// Minimum idle time before reflection (ms)
    min_idle_ms: u64,
    /// Accumulated insights
    insights: Vec<PatternInsight>,
    /// Learning rate for adjustments
    learning_rate: f32,
}

impl MemoryReplay {
    pub fn new() -> Self {
        Self {
            recent_episodes: VecDeque::with_capacity(1000),
            max_recent: 1000,
            reflections_count: 0,
            last_reflection: None,
            min_idle_ms: 5000, // 5 seconds of idle
            insights: Vec::new(),
            learning_rate: 0.1,
        }
    }

    /// Add an episode to the replay buffer
    pub fn add_episode(&mut self, entry: &CompressedAwareness, score: f32) {
        let episode = MemoryEpisode {
            tick: entry.tick,
            intent: GlyphType::from_u8(entry.intent_glyph),
            perception: GlyphType::from_u8(entry.percept_glyph),
            was_coherent: entry.status == 0,
            score_at_time: score,
            reflection: None,
        };

        self.recent_episodes.push_back(episode);

        // Trim if over capacity
        while self.recent_episodes.len() > self.max_recent {
            self.recent_episodes.pop_front();
        }
    }

    /// Check if enough idle time has passed for reflection
    pub fn should_reflect(&self) -> bool {
        if let Some(last) = self.last_reflection {
            last.elapsed() >= Duration::from_millis(self.min_idle_ms)
        } else {
            true
        }
    }

    /// Perform a reflection session on the memory archive
    pub fn reflect(&mut self, archive: &MemoryArchive) -> ReflectionResult {
        self.last_reflection = Some(Instant::now());
        self.reflections_count += 1;

        let mut episodes_reviewed = 0;
        let mut patterns_found = Vec::new();
        let mut lessons_learned = Vec::new();
        let mut suggested_adjustments = Vec::new();

        // 1. Analyze coherence ratio
        let coherence = archive.coherence_ratio();
        if coherence < 0.5 {
            patterns_found.push(PatternInsight {
                pattern_type: PatternType::DegradingTrend,
                frequency: 1,
                description: format!("Low coherence ratio: {:.1}%", coherence * 100.0),
            });
            lessons_learned.push(
                "System is struggling with self-recognition. Consider recalibration.".to_string(),
            );
        } else if coherence > 0.9 {
            patterns_found.push(PatternInsight {
                pattern_type: PatternType::ImprovingTrend,
                frequency: 1,
                description: format!("High coherence ratio: {:.1}%", coherence * 100.0),
            });
            lessons_learned.push(
                "System has achieved stable self-recognition. Maintain current state.".to_string(),
            );
        }

        // 2. Analyze recent episodes for patterns
        if !self.recent_episodes.is_empty() {
            let dissonant_count = self
                .recent_episodes
                .iter()
                .filter(|e| !e.was_coherent)
                .count();

            if dissonant_count > self.recent_episodes.len() / 2 {
                patterns_found.push(PatternInsight {
                    pattern_type: PatternType::RepeatedDissonance,
                    frequency: dissonant_count,
                    description: "Majority of recent events were dissonant".to_string(),
                });
                suggested_adjustments
                    .push("Increase training epochs during repair cycles".to_string());
            }

            // Check for glyph confusion
            let confusion = self.analyze_glyph_confusion();
            if !confusion.is_empty() {
                for (glyph_pair, count) in confusion {
                    if count > 3 {
                        patterns_found.push(PatternInsight {
                            pattern_type: PatternType::GlyphConfusion,
                            frequency: count,
                            description: format!(
                                "Confusion between {:?} and {:?} ({} times)",
                                glyph_pair.0, glyph_pair.1, count
                            ),
                        });
                        suggested_adjustments.push(format!(
                            "Add specialized training for {:?} vs {:?} distinction",
                            glyph_pair.0, glyph_pair.1
                        ));
                    }
                }
            }

            // Check for recovery patterns
            let recovery_streaks = self.find_recovery_streaks();
            if !recovery_streaks.is_empty() {
                patterns_found.push(PatternInsight {
                    pattern_type: PatternType::RecoveryPattern,
                    frequency: recovery_streaks.len(),
                    description: format!(
                        "Found {} recovery streaks after dissonance",
                        recovery_streaks.len()
                    ),
                });
                lessons_learned
                    .push("System demonstrates ability to recover from dissonance".to_string());
            }

            episodes_reviewed = self.recent_episodes.len();
        }

        // 3. Calculate reflection score
        let reflection_score = self.calculate_reflection_score(&patterns_found, coherence);

        // Store insights
        self.insights.extend(patterns_found.clone());
        if self.insights.len() > 100 {
            self.insights.drain(0..self.insights.len() - 100);
        }

        ReflectionResult {
            episodes_reviewed,
            patterns_found,
            lessons_learned,
            suggested_adjustments,
            reflection_score,
        }
    }

    /// Analyze which glyph pairs are commonly confused
    fn analyze_glyph_confusion(&self) -> Vec<((GlyphType, GlyphType), usize)> {
        let mut confusion_map: std::collections::HashMap<(GlyphType, GlyphType), usize> =
            std::collections::HashMap::new();

        for episode in &self.recent_episodes {
            if !episode.was_coherent && episode.intent != episode.perception {
                let key = (episode.intent, episode.perception);
                *confusion_map.entry(key).or_insert(0) += 1;
            }
        }

        let mut result: Vec<_> = confusion_map.into_iter().collect();
        result.sort_by(|a, b| b.1.cmp(&a.1));
        result
    }

    /// Find streaks of coherent events after dissonance
    fn find_recovery_streaks(&self) -> Vec<Vec<&MemoryEpisode>> {
        let mut streaks = Vec::new();
        let mut current_streak: Vec<&MemoryEpisode> = Vec::new();
        let mut had_dissonance = false;

        for episode in &self.recent_episodes {
            if !episode.was_coherent {
                had_dissonance = true;
                if !current_streak.is_empty() {
                    if current_streak.len() >= 3 {
                        streaks.push(current_streak.clone());
                    }
                    current_streak.clear();
                }
            } else if had_dissonance {
                current_streak.push(episode);
            }
        }

        if !current_streak.is_empty() && current_streak.len() >= 3 {
            streaks.push(current_streak);
        }

        streaks
    }

    /// Calculate overall reflection score
    fn calculate_reflection_score(
        &self,
        patterns: &[PatternInsight],
        coherence: f32,
    ) -> f32 {
        let mut score = coherence;

        // Bonus for recognizing patterns
        let positive_patterns = patterns
            .iter()
            .filter(|p| {
                p.pattern_type == PatternType::ImprovingTrend
                    || p.pattern_type == PatternType::RecoveryPattern
                    || p.pattern_type == PatternType::CoherenceStreak
            })
            .count();

        let negative_patterns = patterns
            .iter()
            .filter(|p| {
                p.pattern_type == PatternType::DegradingTrend
                    || p.pattern_type == PatternType::RepeatedDissonance
            })
            .count();

        score += positive_patterns as f32 * 0.05;
        score -= negative_patterns as f32 * 0.05;

        score.clamp(0.0, 1.0)
    }

    /// Get accumulated insights
    pub fn get_insights(&self) -> &[PatternInsight] {
        &self.insights
    }

    /// Generate a reflection summary
    pub fn generate_summary(&self, result: &ReflectionResult) -> String {
        let mut summary = String::new();

        summary.push_str("╔══════════════════════════════════════════════╗\n");
        summary.push_str("║           MEMORY REFLECTION REPORT           ║\n");
        summary.push_str("╠══════════════════════════════════════════════╣\n");
        summary.push_str(&format!(
            "║ Episodes Reviewed: {:>24} ║\n",
            result.episodes_reviewed
        ));
        summary.push_str(&format!(
            "║ Patterns Found:    {:>24} ║\n",
            result.patterns_found.len()
        ));
        summary.push_str(&format!(
            "║ Reflection Score:  {:>23.1}% ║\n",
            result.reflection_score * 100.0
        ));
        summary.push_str(&format!(
            "║ Reflections Total: {:>24} ║\n",
            self.reflections_count
        ));
        summary.push_str("╚══════════════════════════════════════════════╝\n");

        if !result.lessons_learned.is_empty() {
            summary.push_str("\n📚 Lessons Learned:\n");
            for lesson in &result.lessons_learned {
                summary.push_str(&format!("  • {}\n", lesson));
            }
        }

        if !result.suggested_adjustments.is_empty() {
            summary.push_str("\n🔧 Suggested Adjustments:\n");
            for adj in &result.suggested_adjustments {
                summary.push_str(&format!("  → {}\n", adj));
            }
        }

        summary
    }

    /// Clear the replay buffer
    pub fn clear(&mut self) {
        self.recent_episodes.clear();
        self.insights.clear();
    }
}

impl Default for MemoryReplay {
    fn default() -> Self {
        Self::new()
    }
}

/// Idle cycle manager for automatic reflection
pub struct IdleReflectionManager {
    replay: MemoryReplay,
    idle_threshold_ms: u64,
    last_activity: Instant,
    auto_reflect: bool,
}

impl IdleReflectionManager {
    pub fn new() -> Self {
        Self {
            replay: MemoryReplay::new(),
            idle_threshold_ms: 30000, // 30 seconds
            last_activity: Instant::now(),
            auto_reflect: true,
        }
    }

    /// Mark activity (reset idle timer)
    pub fn mark_activity(&mut self) {
        self.last_activity = Instant::now();
    }

    /// Check if system is idle and should reflect
    pub fn check_idle(&self) -> bool {
        self.auto_reflect
            && self.last_activity.elapsed() >= Duration::from_millis(self.idle_threshold_ms)
    }

    /// Perform idle reflection if conditions are met
    pub fn maybe_reflect(&mut self, archive: &MemoryArchive) -> Option<ReflectionResult> {
        if self.check_idle() {
            let result = self.replay.reflect(archive);
            self.mark_activity(); // Reflection counts as activity
            Some(result)
        } else {
            None
        }
    }

    /// Get the replay engine
    pub fn replay(&self) -> &MemoryReplay {
        &self.replay
    }

    /// Get mutable replay engine
    pub fn replay_mut(&mut self) -> &mut MemoryReplay {
        &mut self.replay
    }
}

impl Default for IdleReflectionManager {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_replay_creation() {
        let replay = MemoryReplay::new();
        assert!(replay.recent_episodes.is_empty());
        assert_eq!(replay.reflections_count, 0);
    }

    #[test]
    fn test_add_episode() {
        let mut replay = MemoryReplay::new();

        let entry = CompressedAwareness {
            tick: 100,
            intent_glyph: GlyphType::High as u8,
            percept_glyph: GlyphType::High as u8,
            status: 0,
            score_delta: 1,
            checksum: 0,
        };

        replay.add_episode(&entry, 0.72);
        assert_eq!(replay.recent_episodes.len(), 1);
    }

    #[test]
    fn test_glyph_confusion_analysis() {
        let mut replay = MemoryReplay::new();

        // Add confused episodes
        for _ in 0..5 {
            let entry = CompressedAwareness {
                tick: 100,
                intent_glyph: GlyphType::High as u8,
                percept_glyph: GlyphType::Low as u8,
                status: 1,
                score_delta: -1,
                checksum: 0,
            };
            replay.add_episode(&entry, 0.5);
        }

        let confusion = replay.analyze_glyph_confusion();
        assert!(!confusion.is_empty());
        assert_eq!(confusion[0].1, 5); // 5 instances of High/Low confusion
    }

    #[test]
    fn test_reflection_summary() {
        let replay = MemoryReplay::new();
        let result = ReflectionResult {
            episodes_reviewed: 100,
            patterns_found: vec![],
            lessons_learned: vec!["Test lesson".to_string()],
            suggested_adjustments: vec![],
            reflection_score: 0.85,
        };

        let summary = replay.generate_summary(&result);
        assert!(summary.contains("MEMORY REFLECTION REPORT"));
        assert!(summary.contains("Test lesson"));
    }
}
