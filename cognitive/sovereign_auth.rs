// sovereign_auth.rs - The Notary
// 
// Human-in-the-Loop authentication for GQR blocks
// Validates cursor gestures (Z-pattern, custom geometry)
// AI proposes → Human signs → Directive ratified

use std::collections::HashMap;

/// Signature pattern types
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SignaturePattern {
    /// Z-pattern (standard)
    ZPattern,
    /// Checkmark
    Checkmark,
    /// Circle
    Circle,
    /// Triangle
    Triangle,
    /// Custom pattern
    Custom,
}

/// Cursor trace point
#[derive(Debug, Clone, Copy)]
pub struct TracePoint {
    pub x: u32,
    pub y: u32,
    pub timestamp: u64,
}

/// Authorization requirement
#[derive(Debug, Clone)]
pub struct AuthRequirement {
    /// Required pattern
    pub pattern: SignaturePattern,
    /// Minimum match percentage (0.0 - 1.0)
    pub threshold: f32,
    /// Time limit (milliseconds)
    pub time_limit: u64,
    /// Required intent type (only specific intents need auth)
    pub required_for: Vec<GqrIntent>,
}

/// Authorization result
#[derive(Debug, Clone)]
pub struct AuthResult {
    /// Match percentage
    pub match_percentage: f32,
    /// Pattern detected
    pub pattern_detected: SignaturePattern,
    /// Time taken (ms)
    pub time_taken: u64,
    /// Authorized?
    pub authorized: bool,
    /// Reason (if denied)
    pub reason: Option<String>,
}

/// GQR Intent (must match other modules)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GqrIntent {
    DataConstant,
    ProcessorNode,
    BusPathway,
    ExecutiveOrder,
    MemoryArchive,
    VetoZone,
    ContractProposal,
    Unknown,
}

/// Sovereign Authenticator - The Notary
pub struct SovereignAuth {
    /// Current cursor trace
    current_trace: Vec<TracePoint>,
    /// Reference patterns
    patterns: HashMap<SignaturePattern, Vec<(f32, f32)>>, // Normalized (x, y)
    /// Authorization requirements by intent
    requirements: HashMap<GqrIntent, AuthRequirement>,
    /// Active authorization session
    active_session: Option<AuthSession>,
    /// Authorization history
    history: Vec<AuthResult>,
}

/// Active authorization session
#[derive(Debug, Clone)]
struct AuthSession {
    /// GQR block being authorized
    gqr_id: u64,
    /// GQR position
    gqr_position: [u32; 2],
    /// Start time
    start_time: u64,
    /// Required pattern
    required_pattern: SignaturePattern,
}

impl SovereignAuth {
    /// Create new authenticator with default patterns
    pub fn new() -> Self {
        let mut auth = Self {
            current_trace: Vec::new(),
            patterns: HashMap::new(),
            requirements: HashMap::new(),
            active_session: None,
            history: Vec::new(),
        };
        
        // Initialize default patterns (normalized 0.0 - 1.0)
        auth.init_default_patterns();
        auth.init_default_requirements();
        
        auth
    }
    
    /// Initialize default signature patterns
    fn init_default_patterns(&mut self) {
        // Z-pattern: top-left → top-right → bottom-left → bottom-right
        self.patterns.insert(SignaturePattern::ZPattern, vec![
            (0.0, 0.0),   // Start top-left
            (1.0, 0.0),   // Top-right
            (0.0, 1.0),   // Bottom-left
            (1.0, 1.0),   // Bottom-right (end)
        ]);
        
        // Checkmark: bottom-left → center-top → bottom-right
        self.patterns.insert(SignaturePattern::Checkmark, vec![
            (0.2, 0.6),   // Start
            (0.5, 0.2),   // Peak
            (1.0, 1.0),   // End
        ]);
        
        // Circle: 8 points around circumference
        let mut circle = Vec::new();
        for i in 0..8 {
            let angle = (i as f32) * std::f32::consts::PI * 2.0 / 8.0;
            circle.push((0.5 + angle.cos() * 0.4, 0.5 + angle.sin() * 0.4));
        }
        self.patterns.insert(SignaturePattern::Circle, circle);
        
        // Triangle: 3 points
        self.patterns.insert(SignaturePattern::Triangle, vec![
            (0.5, 0.0),   // Top
            (0.0, 1.0),   // Bottom-left
            (1.0, 1.0),   // Bottom-right
        ]);
    }
    
    /// Initialize default authorization requirements
    fn init_default_requirements(&mut self) {
        // Contract proposals require Z-pattern with 95% match
        self.requirements.insert(GqrIntent::ContractProposal, AuthRequirement {
            pattern: SignaturePattern::ZPattern,
            threshold: 0.95,
            time_limit: 5000, // 5 seconds
            required_for: vec![GqrIntent::ContractProposal],
        });
        
        // Executive orders require checkmark with 90% match
        self.requirements.insert(GqrIntent::ExecutiveOrder, AuthRequirement {
            pattern: SignaturePattern::Checkmark,
            threshold: 0.90,
            time_limit: 3000,
            required_for: vec![GqrIntent::ExecutiveOrder],
        });
        
        // Other intents don't require auth (empty requirements)
    }
    
    /// Start authorization session for a GQR block
    pub fn start_session(
        &mut self,
        gqr_id: u64,
        gqr_position: [u32; 2],
        gqr_size: u32,
        intent: GqrIntent,
        current_time: u64,
    ) -> bool {
        // Check if this intent requires authorization
        if let Some(req) = self.requirements.get(&intent) {
            self.active_session = Some(AuthSession {
                gqr_id,
                gqr_position,
                start_time: current_time,
                required_pattern: req.pattern,
            });
            
            // Clear previous trace
            self.current_trace.clear();
            
            println!("✍️ NOTARY: Authorization session started for block {}", gqr_id);
            println!("  Required pattern: {:?}", req.pattern);
            println!("  Trace over block at ({}, {})", gqr_position[0], gqr_position[1]);
            
            return true;
        }
        
        false
    }
    
    /// Add trace point from cursor movement
    pub fn add_trace_point(&mut self, x: u32, y: u32, timestamp: u64) {
        // Only record if within active session
        if self.active_session.is_some() {
            self.current_trace.push(TracePoint { x, y, timestamp });
        }
    }
    
    /// Verify signature against required pattern
    pub fn verify_signature(&mut self, current_time: u64) -> AuthResult {
        // Check for active session
        let session = match &self.active_session {
            Some(s) => s.clone(),
            None => {
                return AuthResult {
                    match_percentage: 0.0,
                    pattern_detected: SignaturePattern::Custom,
                    time_taken: 0,
                    authorized: false,
                    reason: Some("No active authorization session".to_string()),
                };
            }
        };
        
        // Check time limit
        let time_taken = current_time - session.start_time;
        let req = self.requirements.get(&GqrIntent::ContractProposal).unwrap();
        
        if time_taken > req.time_limit {
            self.active_session = None;
            return AuthResult {
                match_percentage: 0.0,
                pattern_detected: session.required_pattern,
                time_taken,
                authorized: false,
                reason: Some(format!("Time limit exceeded ({}ms)", time_taken)),
            };
        }
        
        // Need at least 3 trace points
        if self.current_trace.len() < 3 {
            return AuthResult {
                match_percentage: 0.0,
                pattern_detected: SignaturePattern::Custom,
                time_taken,
                authorized: false,
                reason: Some("Insufficient trace points".to_string()),
            };
        }
        
        // Normalize trace to GQR block coordinates
        let normalized_trace = self.normalize_trace(&session.gqr_position, 3);
        
        // Compare against required pattern
        let pattern_points = self.patterns.get(&session.required_pattern).unwrap();
        let match_percentage = self.calculate_match(&normalized_trace, pattern_points);
        
        // Determine if authorized
        let authorized = match_percentage >= req.threshold;
        
        // Detect which pattern was actually traced
        let pattern_detected = self.detect_pattern(&normalized_trace);
        
        let result = AuthResult {
            match_percentage,
            pattern_detected,
            time_taken,
            authorized,
            reason: if !authorized {
                Some(format!("Match {:.1}% below threshold {:.1}%", 
                    match_percentage * 100.0, req.threshold * 100.0))
            } else {
                None
            },
        };
        
        // Log result
        if authorized {
            println!("✍️ NOTARY: Signature Match {:.1}%. Directive Ratified.", match_percentage * 100.0);
        } else {
            println!("❌ NOTARY: Authorization failed. {:.1}% match", match_percentage * 100.0);
        }
        
        // Store in history
        self.history.push(result.clone());
        
        // Clear session
        self.active_session = None;
        self.current_trace.clear();
        
        result
    }
    
    /// Normalize trace points to 0.0-1.0 range relative to GQR block
    fn normalize_trace(&self, gqr_position: &[u32; 2], gqr_size: u32) -> Vec<(f32, f32)> {
        if self.current_trace.is_empty() {
            return Vec::new();
        }
        
        // Find bounding box of trace
        let min_x = self.current_trace.iter().map(|p| p.x).min().unwrap();
        let max_x = self.current_trace.iter().map(|p| p.x).max().unwrap();
        let min_y = self.current_trace.iter().map(|p| p.y).min().unwrap();
        let max_y = self.current_trace.iter().map(|p| p.y).max().unwrap();
        
        let width = (max_x - min_x).max(1) as f32;
        let height = (max_y - min_y).max(1) as f32;
        
        // Normalize to 0.0-1.0
        self.current_trace.iter().map(|p| {
            (
                (p.x - min_x) as f32 / width,
                (p.y - min_y) as f32 / height,
            )
        }).collect()
    }
    
    /// Calculate match percentage between trace and pattern
    fn calculate_match(&self, trace: &[(f32, f32)], pattern: &[(f32, f32)]) -> f32 {
        if trace.is_empty() || pattern.is_empty() {
            return 0.0;
        }
        
        // Simplify trace to same number of points as pattern
        let simplified = self.simplify_trace(trace, pattern.len());
        
        // Calculate average distance
        let mut total_distance = 0.0;
        for (trace_pt, pattern_pt) in simplified.iter().zip(pattern.iter()) {
            let dx = trace_pt.0 - pattern_pt.0;
            let dy = trace_pt.1 - pattern_pt.1;
            total_distance += (dx * dx + dy * dy).sqrt();
        }
        
        let avg_distance = total_distance / pattern.len() as f32;
        
        // Convert to match percentage (distance 0 = 100%, distance 1+ = 0%)
        let match_score = 1.0 - avg_distance.min(1.0);
        
        match_score
    }
    
    /// Simplify trace to n points using Douglas-Peucker style reduction
    fn simplify_trace(&self, trace: &[(f32, f32)], n: usize) -> Vec<(f32, f32)> {
        if trace.len() <= n {
            return trace.to_vec();
        }
        
        let mut simplified = Vec::new();
        let step = trace.len() as f32 / n as f32;
        
        for i in 0..n {
            let idx = (i as f32 * step) as usize;
            let idx = idx.min(trace.len() - 1);
            simplified.push(trace[idx]);
        }
        
        simplified
    }
    
    /// Detect which pattern was traced
    fn detect_pattern(&self, trace: &[(f32, f32)]) -> SignaturePattern {
        let mut best_match = SignaturePattern::Custom;
        let mut best_score = 0.0;
        
        for (pattern_type, pattern_points) in &self.patterns {
            let score = self.calculate_match(trace, pattern_points);
            if score > best_score {
                best_score = score;
                best_match = *pattern_type;
            }
        }
        
        best_match
    }
    
    /// Cancel active session
    pub fn cancel_session(&mut self) {
        self.active_session = None;
        self.current_trace.clear();
        println!("✍️ NOTARY: Authorization session cancelled");
    }
    
    /// Get authorization history
    pub fn get_history(&self) -> &Vec<AuthResult> {
        &self.history
    }
    
    /// Set custom pattern
    pub fn set_custom_pattern(&mut self, points: Vec<(f32, f32)>) {
        self.patterns.insert(SignaturePattern::Custom, points);
    }
    
    /// Set authorization requirement for intent
    pub fn set_requirement(&mut self, intent: GqrIntent, req: AuthRequirement) {
        self.requirements.insert(intent, req);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_auth_initialization() {
        let auth = SovereignAuth::new();
        
        assert!(auth.patterns.contains_key(&SignaturePattern::ZPattern));
        assert!(auth.patterns.contains_key(&SignaturePattern::Checkmark));
        assert!(auth.requirements.contains_key(&GqrIntent::ContractProposal));
    }
    
    #[test]
    fn test_session_start() {
        let mut auth = SovereignAuth::new();
        
        let started = auth.start_session(
            1,
            [10, 10],
            3,
            GqrIntent::ContractProposal,
            1000,
        );
        
        assert!(started);
        assert!(auth.active_session.is_some());
    }
    
    #[test]
    fn test_trace_collection() {
        let mut auth = SovereignAuth::new();
        
        auth.start_session(1, [10, 10], 3, GqrIntent::ContractProposal, 1000);
        
        auth.add_trace_point(10, 10, 1000);
        auth.add_trace_point(15, 10, 1100);
        auth.add_trace_point(10, 15, 1200);
        auth.add_trace_point(15, 15, 1300);
        
        assert_eq!(auth.current_trace.len(), 4);
    }
    
    #[test]
    fn test_pattern_detection() {
        let auth = SovereignAuth::new();
        
        // Z-pattern trace
        let z_trace = vec![
            (0.0, 0.0),
            (1.0, 0.0),
            (0.0, 1.0),
            (1.0, 1.0),
        ];
        
        let detected = auth.detect_pattern(&z_trace);
        assert_eq!(detected, SignaturePattern::ZPattern);
    }
}

// Demo: Sovereign authentication
fn main() {
    println!("✍️ Sovereign Auth - The Notary");
    println!("===============================\n");
    
    let mut auth = SovereignAuth::new();
    
    // Start session for a contract proposal
    println!("Starting authorization session for ContractProposal...");
    auth.start_session(
        1,
        [10, 10],
        3,
        GqrIntent::ContractProposal,
        1000,
    );
    
    // Simulate Z-pattern trace
    println!("\nSimulating Z-pattern trace:");
    println!("  (10, 10) → (20, 10) → (10, 20) → (20, 20)");
    
    auth.add_trace_point(10, 10, 1000);
    auth.add_trace_point(15, 10, 1100);
    auth.add_trace_point(20, 10, 1200);
    auth.add_trace_point(18, 15, 1300);
    auth.add_trace_point(15, 18, 1400);
    auth.add_trace_point(10, 20, 1500);
    auth.add_trace_point(15, 20, 1600);
    auth.add_trace_point(20, 20, 1700);
    
    // Verify signature
    let result = auth.verify_signature(2000);
    
    println!("\nAuthorization Result:");
    println!("  Match: {:.1}%", result.match_percentage * 100.0);
    println!("  Pattern: {:?}", result.pattern_detected);
    println!("  Time: {}ms", result.time_taken);
    println!("  Authorized: {}", if result.authorized { "✓ YES" } else { "✗ NO" });
    
    if let Some(reason) = result.reason {
        println!("  Reason: {}", reason);
    }
    
    // Test failed auth (wrong pattern)
    println!("\n\nTesting failed authorization...");
    auth.start_session(2, [30, 10], 3, GqrIntent::ContractProposal, 3000);
    
    // Trace a circle instead of Z
    println!("  Tracing circle instead of Z...");
    for i in 0..8 {
        let angle = (i as f32) * std::f32::consts::PI * 2.0 / 8.0;
        let x = (35.0 + angle.cos() * 5.0) as u32;
        let y = (15.0 + angle.sin() * 5.0) as u32;
        auth.add_trace_point(x, y, 3000 + i as u64 * 100);
    }
    
    let result2 = auth.verify_signature(4000);
    
    println!("\nAuthorization Result:");
    println!("  Match: {:.1}%", result2.match_percentage * 100.0);
    println!("  Pattern: {:?}", result2.pattern_detected);
    println!("  Authorized: {}", if result2.authorized { "✓ YES" } else { "✗ NO" });
    
    println!("\n✅ Notary operational");
}
