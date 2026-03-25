// executive_commander.rs - The Leadership Module
// Phase 26: Executive function and system orchestration

use std::collections::HashMap;

/// Executive directives the AI can issue
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Directive {
    Idle = 0x00,
    OptimizePerformance = 0x01,
    DeepLearning = 0x02,
    ExpandCollective = 0x03,
    Repair = 0x04,
}

impl Directive {
    pub fn from_u8(value: u8) -> Self {
        match value {
            0x01 => Directive::OptimizePerformance,
            0x02 => Directive::DeepLearning,
            0x03 => Directive::ExpandCollective,
            0x04 => Directive::Repair,
            _ => Directive::Idle,
        }
    }
    
    pub fn to_name(&self) -> &'static str {
        match self {
            Directive::Idle => "IDLE",
            Directive::OptimizePerformance => "OPTIMIZE_PERFORMANCE",
            Directive::DeepLearning => "DEEP_LEARNING",
            Directive::ExpandCollective => "EXPAND_COLLECTIVE",
            Directive::Repair => "REPAIR",
        }
    }
}

/// System metrics the Commander evaluates
#[derive(Debug, Clone)]
pub struct SystemMetrics {
    pub coherence_ratio: f32,
    pub memory_usage: f32,
    pub cpu_load: f32,
    pub gpu_load: f32,
    pub network_latency_ms: f32,
    pub dissonant_count: u64,
    pub total_tests: u64,
    pub uptime_seconds: u64,
}

/// A proposed directive awaiting ratification
#[derive(Debug, Clone)]
pub struct ProposedDirective {
    pub directive: Directive,
    pub reason: String,
    pub proposed_tick: u64,
    pub confidence: f32,
    pub ratified: bool,
    pub vetoed: bool,
}

/// The Commander - orchestrates the entire Geometry OS
pub struct Commander {
    pub current_directive: Directive,
    pub goal_alignment_score: f32,
    pub proposed_directives: Vec<ProposedDirective>,
    pub directive_history: Vec<(u64, Directive)>,
    pub veto_count: u64,
    pub ratification_count: u64,
    pub mode: CommanderMode,
    pub tick: u64,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CommanderMode {
    Supervised,    // Requires human approval
    Autonomous,    // Full autonomy
    Emergency,     // Crisis mode
}

impl Commander {
    pub fn new() -> Self {
        Self {
            current_directive: Directive::Idle,
            goal_alignment_score: 0.5,
            proposed_directives: Vec::new(),
            directive_history: Vec::new(),
            veto_count: 0,
            ratification_count: 0,
            mode: CommanderMode::Supervised,
            tick: 0,
        }
    }
    
    /// Evaluate system state and issue directives
    pub fn orchestrate(&mut self, metrics: &SystemMetrics) -> Directive {
        self.tick += 1;
        
        // Calculate goal alignment based on system health
        self.goal_alignment_score = self.calculate_alignment(metrics);
        
        // Determine appropriate directive
        let new_directive = self.evaluate_directive(metrics);
        
        // If directive changes, propose it
        if new_directive != self.current_directive {
            self.propose_directive(new_directive, metrics);
        }
        
        // Process any pending proposals
        self.process_proposals();
        
        self.current_directive
    }
    
    fn calculate_alignment(&self, metrics: &SystemMetrics) -> f32 {
        // Weighted combination of health metrics
        let coherence_weight = 0.4;
        let memory_weight = 0.2;
        let load_weight = 0.2;
        let dissonance_weight = 0.2;
        
        let coherence_score = metrics.coherence_ratio;
        let memory_score = 1.0 - metrics.memory_usage.min(1.0);
        let load_score = 1.0 - metrics.cpu_load.max(metrics.gpu_load).min(1.0);
        let dissonance_score = if metrics.total_tests > 0 {
            1.0 - (metrics.dissonant_count as f32 / metrics.total_tests as f32)
        } else {
            1.0
        };
        
        (coherence_score * coherence_weight
            + memory_score * memory_weight
            + load_score * load_weight
            + dissonance_score * dissonance_weight)
            .clamp(0.0, 1.0)
    }
    
    fn evaluate_directive(&self, metrics: &SystemMetrics) -> Directive {
        // Priority 1: System health
        if metrics.coherence_ratio < 0.7 {
            return Directive::Repair;
        }
        
        // Priority 2: Learning opportunity
        if metrics.dissonant_count > 10 {
            return Directive::DeepLearning;
        }
        
        // Priority 3: Expansion
        if metrics.coherence_ratio > 0.9 && self.goal_alignment_score > 0.8 {
            return Directive::ExpandCollective;
        }
        
        // Priority 4: Optimization
        if metrics.coherence_ratio > 0.8 {
            return Directive::OptimizePerformance;
        }
        
        // Default: Idle
        Directive::Idle
    }
    
    fn propose_directive(&mut self, directive: Directive, metrics: &SystemMetrics) {
        let reason = self.generate_reason(directive, metrics);
        
        let proposal = ProposedDirective {
            directive,
            reason,
            proposed_tick: self.tick,
            confidence: self.goal_alignment_score,
            ratified: false,
            vetoed: false,
        };
        
        self.proposed_directives.push(proposal);
        
        println!(
            "🏛️ COMMANDER: Proposed directive {:?} (confidence: {:.1}%)",
            directive,
            self.goal_alignment_score * 100.0
        );
    }
    
    fn generate_reason(&self, directive: Directive, metrics: &SystemMetrics) -> String {
        match directive {
            Directive::Repair => format!(
                "Coherence {:.1}% below threshold (0.7)",
                metrics.coherence_ratio * 100.0
            ),
            Directive::DeepLearning => format!(
                "{} dissonant events require training",
                metrics.dissonant_count
            ),
            Directive::ExpandCollective => format!(
                "System stable (coherence {:.1}%), ready for network expansion",
                metrics.coherence_ratio * 100.0
            ),
            Directive::OptimizePerformance => format!(
                "Coherence {:.1}%, optimizing throughput",
                metrics.coherence_ratio * 100.0
            ),
            Directive::Idle => "System stable, no action needed".to_string(),
        }
    }
    
    fn process_proposals(&mut self) {
        let ratification_timeout = 100; // ticks
        
        for proposal in &mut self.proposed_directives {
            if proposal.ratified || proposal.vetoed {
                continue;
            }
            
            match self.mode {
                CommanderMode::Supervised => {
                    // In supervised mode, wait for human input
                    // (handled by veto/ratify methods)
                    if self.tick - proposal.proposed_tick > ratification_timeout {
                        // Auto-ratify after timeout
                        proposal.ratified = true;
                        self.ratification_count += 1;
                        println!(
                            "🏛️ COMMANDER: Auto-ratified {:?} after timeout",
                            proposal.directive
                        );
                    }
                }
                CommanderMode::Autonomous => {
                    // In autonomous mode, ratify immediately if confidence > 0.8
                    if proposal.confidence > 0.8 {
                        proposal.ratified = true;
                        self.ratification_count += 1;
                    }
                }
                CommanderMode::Emergency => {
                    // In emergency mode, ratify immediately
                    proposal.ratified = true;
                    self.ratification_count += 1;
                }
            }
        }
        
        // Apply ratified proposals
        for proposal in &self.proposed_directives {
            if proposal.ratified && !self.directive_history.iter().any(|(t, _)| *t == proposal.proposed_tick) {
                self.current_directive = proposal.directive;
                self.directive_history.push((proposal.proposed_tick, proposal.directive));
                
                println!(
                    "🏛️ COMMANDER: Applied directive {:?}",
                    proposal.directive
                );
            }
        }
        
        // Clean up old proposals
        self.proposed_directives.retain(|p| {
            self.tick - p.proposed_tick < 1000
        });
    }
    
    /// Veto a proposed directive (human intervention)
    pub fn veto(&mut self, tick: u64) {
        for proposal in &mut self.proposed_directives {
            if proposal.proposed_tick == tick && !proposal.ratified {
                proposal.vetoed = true;
                self.veto_count += 1;
                
                println!(
                    "🏛️ COMMANDER: Directive {:?} vetoed by human",
                    proposal.directive
                );
            }
        }
    }
    
    /// Ratify a proposed directive (human approval)
    pub fn ratify(&mut self, tick: u64) {
        for proposal in &mut self.proposed_directives {
            if proposal.proposed_tick == tick && !proposal.vetoed {
                proposal.ratified = true;
                self.ratification_count += 1;
                
                println!(
                    "🏛️ COMMANDER: Directive {:?} ratified by human",
                    proposal.directive
                );
            }
        }
    }
    
    /// Set commander mode
    pub fn set_mode(&mut self, mode: CommanderMode) {
        self.mode = mode;
        println!("🏛️ COMMANDER: Mode changed to {:?}", mode);
    }
    
    /// Generate status report
    pub fn status_report(&self) -> String {
        let pending = self.proposed_directives.iter().filter(|p| !p.ratified && !p.vetoed).count();
        
        format!(
            "╔════════════════════════════════════════════════════════════════╗\n\
             ║              COMMANDER STATUS REPORT                           ║\n\
             ╚════════════════════════════════════════════════════════════════╝\n\
             \n\
             📊 Current State:\n\
                Directive: {:?}\n\
                Alignment: {:.1}%\n\
                Mode: {:?}\n\
                Tick: {}\n\
             \n\
             📋 Proposals:\n\
                Pending: {}\n\
                Ratified: {}\n\
                Vetoed: {}\n\
             \n\
             🏛️ Executive Summary:\n\
                The Geometry OS is {:?}.\n\
                {:?}\n\
             \n\
             ────────────────────────────────────────────────────────────────",
            self.current_directive,
            self.goal_alignment_score * 100.0,
            self.mode,
            self.tick,
            pending,
            self.ratification_count,
            self.veto_count,
            if self.goal_alignment_score > 0.8 { "HEALTHY" } else if self.goal_alignment_score > 0.6 { "STABLE" } else { "RECOVERING" },
            self.current_directive
        )
    }
}

impl Default for Commander {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_commander_creation() {
        let commander = Commander::new();
        assert_eq!(commander.current_directive, Directive::Idle);
        assert_eq!(commander.mode, CommanderMode::Supervised);
    }
    
    #[test]
    fn test_directive_evaluation() {
        let mut commander = Commander::new();
        
        // Low coherence should trigger repair
        let metrics = SystemMetrics {
            coherence_ratio: 0.5,
            memory_usage: 0.3,
            cpu_load: 0.2,
            gpu_load: 0.2,
            network_latency_ms: 10.0,
            dissonant_count: 5,
            total_tests: 100,
            uptime_seconds: 3600,
        };
        
        let directive = commander.orchestrate(&metrics);
        assert_eq!(directive, Directive::Repair);
    }
    
    #[test]
    fn test_veto() {
        let mut commander = Commander::new();
        
        let metrics = SystemMetrics {
            coherence_ratio: 0.5,
            memory_usage: 0.3,
            cpu_load: 0.2,
            gpu_load: 0.2,
            network_latency_ms: 10.0,
            dissonant_count: 5,
            total_tests: 100,
            uptime_seconds: 3600,
        };
        
        commander.orchestrate(&metrics);
        
        // Veto the first proposal
        if let Some(proposal) = commander.proposed_directives.first() {
            commander.veto(proposal.proposed_tick);
        }
        
        assert_eq!(commander.veto_count, 1);
    }
}
