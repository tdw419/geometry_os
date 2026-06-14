// pathfinding.rs -- A* pathfinding for Memory Palace autonomous navigation
// Phase 204: Autonomous Spatial Exploration
//
// Implements A* with Manhattan-distance heuristic on the infinite 2D grid.
// Buildings and landmarks are graph nodes; edges are Manhattan distances.

use serde::{Deserialize, Serialize};
use std::collections::{BinaryHeap, HashMap, HashSet};

/// A 2D coordinate in the Memory Palace world.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct Point {
    pub x: i32,
    pub y: i32,
}

impl Point {
    pub const fn new(x: i32, y: i32) -> Self {
        Point { x, y }
    }

    /// Manhattan distance to another point.
    pub fn manhattan_distance(&self, other: &Point) -> i32 {
        (self.x - other.x).abs() + (self.y - other.y).abs()
    }

    /// Four cardinal neighbors (no diagonals).
    pub fn neighbors(&self) -> [Point; 4] {
        [
            Point::new(self.x, self.y - 1), // north
            Point::new(self.x + 1, self.y), // east
            Point::new(self.x, self.y + 1), // south
            Point::new(self.x - 1, self.y), // west
        ]
    }

    /// Step direction from this point toward another (first cardinal step).
    pub fn step_toward(&self, target: &Point) -> Point {
        let dx = target.x - self.x;
        let dy = target.y - self.y;
        if dx.abs() >= dy.abs() {
            Point::new(self.x + dx.signum(), self.y)
        } else {
            Point::new(self.x, self.y + dy.signum())
        }
    }

    /// Cardinal direction name from this point to neighbor.
    pub fn direction_to(&self, neighbor: &Point) -> &'static str {
        let dx = neighbor.x - self.x;
        let dy = neighbor.y - self.y;
        match (dx, dy) {
            (0, -1) => "north",
            (1, 0) => "east",
            (0, 1) => "south",
            (-1, 0) => "west",
            _ => "unknown",
        }
    }
}

/// A node in the spatial graph: a landmark position.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GraphNode {
    pub id: String,
    pub position: Point,
    pub tags: Vec<String>,
}

/// Spatial graph for pathfinding.
/// Nodes: buildings + key landmarks (spawn, center).
/// Edges: implicit (Manhattan distance) — the grid is open.
#[derive(Debug, Clone, Default)]
pub struct SpatialGraph {
    pub nodes: Vec<GraphNode>,
}

impl SpatialGraph {
    pub fn new() -> Self {
        SpatialGraph { nodes: Vec::new() }
    }

    /// Add a node (building or landmark).
    pub fn add_node(&mut self, id: String, x: i32, y: i32, tags: Vec<String>) {
        self.nodes.push(GraphNode {
            id,
            position: Point::new(x, y),
            tags,
        });
    }

    /// Find the nearest node to a point within max_distance.
    pub fn nearest_node(&self, pos: &Point, max_distance: i32) -> Option<&GraphNode> {
        self.nodes
            .iter()
            .filter(|n| n.position.manhattan_distance(pos) <= max_distance)
            .min_by_key(|n| n.position.manhattan_distance(pos))
    }

    /// Find node by ID.
    pub fn find_node(&self, id: &str) -> Option<&GraphNode> {
        self.nodes.iter().find(|n| n.id == id)
    }
}

/// A* search result.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PathResult {
    /// Ordered waypoints from start to goal.
    pub waypoints: Vec<Point>,
    /// Total Manhattan distance of the path.
    pub total_distance: i32,
    /// Step-by-step instructions.
    pub instructions: Vec<String>,
    /// Whether a path was found.
    pub found: bool,
}

// A* internal state
#[derive(Debug, Clone, Eq, PartialEq)]
struct AStarNode {
    point: Point,
    cost: i32,      // g(n): actual cost from start
    heuristic: i32, // h(n): estimated cost to goal
}

impl Ord for AStarNode {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        // Reverse: BinaryHeap is max-heap, we want min-heap by f(n) = cost + heuristic
        (other.cost + other.heuristic).cmp(&(self.cost + self.heuristic))
    }
}

impl PartialOrd for AStarNode {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

/// A* pathfinding on the infinite 2D grid.
/// Returns a path from start to goal.
pub fn astar(start: Point, goal: Point) -> PathResult {
    // If start == goal, immediate success
    if start == goal {
        return PathResult {
            waypoints: vec![start],
            total_distance: 0,
            instructions: vec!["Already at destination.".to_string()],
            found: true,
        };
    }

    let mut open = BinaryHeap::new();
    let mut came_from: HashMap<Point, Point> = HashMap::new();
    let mut g_score: HashMap<Point, i32> = HashMap::new();

    let h = start.manhattan_distance(&goal);
    open.push(AStarNode {
        point: start,
        cost: 0,
        heuristic: h,
    });
    g_score.insert(start, 0);

    // Bounded search: don't explore more than 10,000 cells
    let max_explored = 10_000;
    let mut explored = 0;

    while let Some(current) = open.pop() {
        explored += 1;
        if explored > max_explored {
            break;
        }

        if current.point == goal {
            // Reconstruct path
            let mut path = vec![goal];
            let mut curr = goal;
            while let Some(&prev) = came_from.get(&curr) {
                path.push(prev);
                curr = prev;
            }
            path.reverse();

            let total_dist = start.manhattan_distance(&goal);
            let instructions = build_instructions(&path);

            return PathResult {
                waypoints: path,
                total_distance: total_dist,
                instructions,
                found: true,
            };
        }

        let current_g = g_score[&current.point];
        for neighbor in current.point.neighbors() {
            let tentative_g = current_g + 1; // uniform cost grid
            if tentative_g < g_score.get(&neighbor).copied().unwrap_or(i32::MAX) {
                came_from.insert(neighbor, current.point);
                g_score.insert(neighbor, tentative_g);
                let h = neighbor.manhattan_distance(&goal);
                open.push(AStarNode {
                    point: neighbor,
                    cost: tentative_g,
                    heuristic: h,
                });
            }
        }
    }

    // No path found (shouldn't happen on open grid, but bounded search may exhaust)
    PathResult {
        waypoints: vec![],
        total_distance: 0,
        instructions: vec!["No path found (search space exhausted).".to_string()],
        found: false,
    }
}

/// Build human-readable step-by-step instructions from a path.
fn build_instructions(path: &[Point]) -> Vec<String> {
    if path.len() <= 1 {
        return vec!["Already at destination.".to_string()];
    }

    let mut instructions = Vec::new();
    let mut i = 0;
    while i < path.len() - 1 {
        let from = &path[i];
        let to = &path[i + 1];
        let dir = from.direction_to(to);

        // Group consecutive steps in same direction
        let mut count = 1;
        while i + count < path.len() - 1 {
            let next_from = &path[i + count];
            let next_to = &path[i + count + 1];
            if next_from.direction_to(next_to) == dir {
                count += 1;
            } else {
                break;
            }
        }

        if count == 1 {
            instructions.push(format!("Go {} 1 step to ({}, {})", dir, to.x, to.y));
        } else {
            let last = &path[i + count];
            instructions.push(format!(
                "Go {} {} steps to ({}, {})",
                dir, count, last.x, last.y
            ));
        }
        i += count;
    }

    instructions.push(format!(
        "Arrived at destination ({}, {}).",
        path.last().unwrap().x,
        path.last().unwrap().y
    ));
    instructions
}

/// Obstacle set for pathfinding with obstacles.
#[derive(Debug, Clone, Default)]
pub struct ObstacleSet {
    blocked: HashSet<Point>,
}

impl ObstacleSet {
    pub fn new() -> Self {
        ObstacleSet {
            blocked: HashSet::new(),
        }
    }

    /// Mark a tile as blocked.
    pub fn block(&mut self, point: Point) {
        self.blocked.insert(point);
    }

    /// Check if a tile is blocked.
    pub fn is_blocked(&self, point: &Point) -> bool {
        self.blocked.contains(point)
    }

    /// Clear all obstacles.
    pub fn clear(&mut self) {
        self.blocked.clear();
    }

    /// Number of blocked tiles.
    pub fn len(&self) -> usize {
        self.blocked.len()
    }
}

/// A* with obstacle avoidance.
pub fn astar_with_obstacles(start: Point, goal: Point, obstacles: &ObstacleSet) -> PathResult {
    if start == goal {
        return PathResult {
            waypoints: vec![start],
            total_distance: 0,
            instructions: vec!["Already at destination.".to_string()],
            found: true,
        };
    }

    if obstacles.is_blocked(&goal) {
        return PathResult {
            waypoints: vec![],
            total_distance: 0,
            instructions: vec!["Destination is blocked.".to_string()],
            found: false,
        };
    }

    let mut open = BinaryHeap::new();
    let mut came_from: HashMap<Point, Point> = HashMap::new();
    let mut g_score: HashMap<Point, i32> = HashMap::new();

    let h = start.manhattan_distance(&goal);
    open.push(AStarNode {
        point: start,
        cost: 0,
        heuristic: h,
    });
    g_score.insert(start, 0);

    let max_explored = 10_000;
    let mut explored = 0;

    while let Some(current) = open.pop() {
        explored += 1;
        if explored > max_explored {
            break;
        }

        if current.point == goal {
            let mut path = vec![goal];
            let mut curr = goal;
            while let Some(&prev) = came_from.get(&curr) {
                path.push(prev);
                curr = prev;
            }
            path.reverse();

            let total_dist = start.manhattan_distance(&goal);
            let instructions = build_instructions(&path);

            return PathResult {
                waypoints: path,
                total_distance: total_dist,
                instructions,
                found: true,
            };
        }

        let current_g = g_score[&current.point];
        for neighbor in current.point.neighbors() {
            if obstacles.is_blocked(&neighbor) {
                continue;
            }
            let tentative_g = current_g + 1;
            if tentative_g < g_score.get(&neighbor).copied().unwrap_or(i32::MAX) {
                came_from.insert(neighbor, current.point);
                g_score.insert(neighbor, tentative_g);
                let h = neighbor.manhattan_distance(&goal);
                open.push(AStarNode {
                    point: neighbor,
                    cost: tentative_g,
                    heuristic: h,
                });
            }
        }
    }

    PathResult {
        waypoints: vec![],
        total_distance: 0,
        instructions: vec![
            "No path found (search space exhausted or destination blocked by obstacles)."
                .to_string(),
        ],
        found: false,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_point_new_and_distance() {
        let a = Point::new(0, 0);
        let b = Point::new(3, 4);
        assert_eq!(a.manhattan_distance(&b), 7);
    }

    #[test]
    fn test_point_neighbors() {
        let p = Point::new(5, 5);
        let neighbors = p.neighbors();
        assert_eq!(neighbors.len(), 4);
        assert!(neighbors.contains(&Point::new(5, 4))); // north
        assert!(neighbors.contains(&Point::new(6, 5))); // east
        assert!(neighbors.contains(&Point::new(5, 6))); // south
        assert!(neighbors.contains(&Point::new(4, 5))); // west
    }

    #[test]
    fn test_point_direction_to() {
        let p = Point::new(10, 10);
        assert_eq!(p.direction_to(&Point::new(10, 9)), "north");
        assert_eq!(p.direction_to(&Point::new(11, 10)), "east");
        assert_eq!(p.direction_to(&Point::new(10, 11)), "south");
        assert_eq!(p.direction_to(&Point::new(9, 10)), "west");
    }

    #[test]
    fn test_astar_simple() {
        let start = Point::new(0, 0);
        let goal = Point::new(5, 5);
        let result = astar(start, goal);
        assert!(result.found);
        assert!(result.waypoints.len() > 1);
        assert_eq!(*result.waypoints.first().unwrap(), start);
        assert_eq!(*result.waypoints.last().unwrap(), goal);
        assert_eq!(result.total_distance, 10);
    }

    #[test]
    fn test_astar_same_point() {
        let start = Point::new(3, 7);
        let result = astar(start, Point::new(3, 7));
        assert!(result.found);
        assert_eq!(result.waypoints.len(), 1);
        assert_eq!(result.total_distance, 0);
    }

    #[test]
    fn test_astar_path_length() {
        let start = Point::new(0, 0);
        let goal = Point::new(2, 0);
        let result = astar(start, goal);
        assert!(result.found);
        // Path: (0,0) -> (1,0) -> (2,0)
        assert_eq!(result.waypoints.len(), 3);
        assert_eq!(result.total_distance, 2);
    }

    #[test]
    fn test_spatial_graph() {
        let mut graph = SpatialGraph::new();
        graph.add_node("workshop".to_string(), 10, 20, vec!["build".to_string()]);
        graph.add_node("library".to_string(), 30, 20, vec!["archive".to_string()]);

        assert_eq!(graph.nodes.len(), 2);
        let pos = Point::new(15, 20);
        let nearest = graph.nearest_node(&pos, 100);
        assert!(nearest.is_some());
        assert_eq!(nearest.unwrap().id, "workshop");
    }

    #[test]
    fn test_obstacle_set() {
        let mut obs = ObstacleSet::new();
        let blocked = Point::new(5, 5);
        obs.block(blocked);
        assert!(obs.is_blocked(&blocked));
        assert!(!obs.is_blocked(&Point::new(6, 5)));
    }

    #[test]
    fn test_astar_with_obstacles_blocked_goal() {
        let start = Point::new(0, 0);
        let goal = Point::new(3, 3);
        let mut obs = ObstacleSet::new();
        obs.block(goal);
        let result = astar_with_obstacles(start, goal, &obs);
        assert!(!result.found);
    }

    #[test]
    fn test_astar_with_obstacles_path_around() {
        let start = Point::new(0, 0);
        let goal = Point::new(0, 3);
        let mut obs = ObstacleSet::new();
        obs.block(Point::new(0, 1)); // block direct path
        let result = astar_with_obstacles(start, goal, &obs);
        assert!(result.found);
        // Path should go around: (0,0) -> (1,0) -> (1,1) -> (1,2) -> (1,3)? No...
        // Actually: (0,0) -> (1,0) -> (1,1) -> (1,2) -> (0,2) -> (0,3)
        // Or:      (0,0) -> (-1,0) -> (-1,1) -> (-1,2) -> (0,2) -> (0,3)
        assert!(!result.waypoints.contains(&Point::new(0, 1)));
    }

    #[test]
    fn test_build_instructions() {
        let path = vec![
            Point::new(0, 0),
            Point::new(0, 1),
            Point::new(0, 2),
            Point::new(1, 2),
            Point::new(2, 2),
        ];
        let instructions = build_instructions(&path);
        assert!(instructions.len() >= 3);
        // Should contain grouped steps
        assert!(instructions.iter().any(|i| i.contains("south")));
        assert!(instructions.iter().any(|i| i.contains("east")));
        assert!(instructions.last().unwrap().contains("Arrived"));
    }
}
