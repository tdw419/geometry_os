# World of Rectification (WoR) Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a WordPress-based game plugin that gamifies Tikkun Olam (repairing the world) with easy/hard mode decisions, CTRM scoring, TMS integration, and distributed local node sync.

**Architecture:** A new WordPress plugin `world-of-rectification` that extends the existing `geometry-os-swarm-node` for sync and `ai-publisher.php` for CTRM/TMS integration. Players can choose easy mode (obvious choices) or hard mode (contribute to Geometry OS) at each decision point.

**Tech Stack:** PHP 8.x, WordPress 6.x, MySQL/MariaDB, REST API, existing geometry-os-swarm-node plugin, ai-publisher.php bridge

---

## Overview: Core Components

| Component | Description |
|-----------|-------------|
| **Game Plugin** | `world-of-rectification.php` - Main plugin with scenarios, decisions, scoring |
| **Custom Post Types** | `wor_scenario`, `wor_decision`, `wor_player`, `wor_spark` |
| **REST API** | Endpoints for game actions, CTRM scoring, sync |
| **CTRM Integration** | Extends ai-publisher.php with game actions |
| **Node Sync** | Uses existing geometry-os-swarm-node `/sync` endpoint |

---

## Phase 1: Foundation (Plugin & Database)

### Task 1: Create Plugin Directory Structure

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/world-of-rectification.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-ctrm-scorer.php`

**Step 1: Create plugin main file**

```php
<?php
/**
 * Plugin Name: World of Rectification
 * Description: Gamify Tikkun Olam - Repair the world through play
 * Version: 1.0.0
 * Author: Geometry OS
 *
 * The World of Rectification (WoR) transforms the act of world repair
 * into an engaging game where players discover "sparks" trapped in
 * "husks" (broken elements) and liberate them through acts of rectification.
 */

if (!defined('ABSPATH')) {
    exit;
}

define('WOR_VERSION', '1.0.0');
define('WOR_PLUGIN_DIR', plugin_dir_path(__FILE__));
define('WOR_PLUGIN_URL', plugin_dir_url(__FILE__));

// Include required classes
require_once WOR_PLUGIN_DIR . 'includes/class-game-engine.php';
require_once WOR_PLUGIN_DIR . 'includes/class-ctrm-scorer.php';

/**
 * Initialize the plugin
 */
function wor_init() {
    $game_engine = new WoR_GameEngine();
    $game_engine->init();
}
add_action('plugins_loaded', 'wor_init');

/**
 * Activation hook - create database tables
 */
function wor_activate() {
    require_once WOR_PLUGIN_DIR . 'includes/class-game-engine.php';
    $engine = new WoR_GameEngine();
    $engine->create_tables();
}
register_activation_hook(__FILE__, 'wor_activate');
```

**Step 2: Create includes directory and game engine class**

```php
<?php
/**
 * World of Rectification Game Engine
 *
 * Handles scenarios, decisions, scoring, and game state.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_GameEngine {

    private $table_scenarios;
    private $table_decisions;
    private $table_players;
    private $table_sparks;

    public function __construct() {
        global $wpdb;
        $this->table_scenarios = $wpdb->prefix . 'wor_scenarios';
        $this->table_decisions = $wpdb->prefix . 'wor_decisions';
        $this->table_players = $wpdb->prefix . 'wor_players';
        $this->table_sparks = $wpdb->prefix . 'wor_sparks';
    }

    /**
     * Initialize the game engine
     */
    public function init() {
        add_action('rest_api_init', [$this, 'register_routes']);
        add_action('init', [$this, 'register_post_types']);
    }

    /**
     * Create database tables on activation
     */
    public function create_tables() {
        global $wpdb;
        $charset_collate = $wpdb->get_charset_collate();

        $sql_scenarios = "CREATE TABLE {$this->table_scenarios} (
            id bigint(20) NOT NULL AUTO_INCREMENT,
            title varchar(255) NOT NULL,
            description text NOT NULL,
            sefirah varchar(50) DEFAULT 'chesed',
            difficulty_easy text,
            difficulty_hard text,
            hard_contribution_type varchar(50) DEFAULT 'data',
            ct rm_weight decimal(3,2) DEFAULT 1.00,
            created_at datetime DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id)
        ) {$charset_collate};";

        $sql_decisions = "CREATE TABLE {$this->table_decisions} (
            id bigint(20) NOT NULL AUTO_INCREMENT,
            player_id bigint(20) NOT NULL,
            scenario_id bigint(20) NOT NULL,
            mode varchar(10) NOT NULL DEFAULT 'easy',
            choice text NOT NULL,
            reasoning text,
            ct rm_score decimal(5,2) DEFAULT 0.00,
            contribution_data text,
            created_at datetime DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            KEY player_id (player_id),
            KEY scenario_id (scenario_id)
        ) {$charset_collate};";

        $sql_players = "CREATE TABLE {$this->table_players} (
            id bigint(20) NOT NULL AUTO_INCREMENT,
            user_id bigint(20) NOT NULL,
            node_id varchar(100) DEFAULT NULL,
            sefirah_primary varchar(50) DEFAULT 'chesed',
            ct rm_total decimal(8,2) DEFAULT 0.00,
            tms_level int(11) DEFAULT 1,
            sparks_released int(11) DEFAULT 0,
            created_at datetime DEFAULT CURRENT_TIMESTAMP,
            updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            UNIQUE KEY user_id (user_id)
        ) {$charset_collate};";

        $sql_sparks = "CREATE TABLE {$this->table_sparks} (
            id bigint(20) NOT NULL AUTO_INCREMENT,
            decision_id bigint(20) NOT NULL,
            verified tinyint(1) DEFAULT 0,
            verification_type varchar(50) DEFAULT 'algorithmic',
            tzedakah_credits decimal(8,2) DEFAULT 0.00,
            created_at datetime DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            KEY decision_id (decision_id)
        ) {$charset_collate};";

        require_once ABSPATH . 'wp-admin/includes/upgrade.php';
        dbDelta($sql_scenarios);
        dbDelta($sql_decisions);
        dbDelta($sql_players);
        dbDelta($sql_sparks);
    }

    /**
     * Register custom post types
     */
    public function register_post_types() {
        register_post_type('wor_scenario', [
            'labels' => [
                'name' => 'Scenarios',
                'singular_name' => 'Scenario',
            ],
            'public' => true,
            'has_archive' => true,
            'supports' => ['title', 'editor', 'custom-fields'],
            'show_in_rest' => true,
        ]);
    }

    /**
     * Register REST API routes
     */
    public function register_routes() {
        register_rest_route('wor/v1', '/scenario/(?P<id>\d+)', [
            'methods' => 'GET',
            'callback' => [$this, 'get_scenario'],
            'permission_callback' => '__return_true',
        ]);

        register_rest_route('wor/v1', '/decide', [
            'methods' => 'POST',
            'callback' => [$this, 'make_decision'],
            'permission_callback' => [$this, 'check_auth'],
        ]);

        register_rest_route('wor/v1', '/player/me', [
            'methods' => 'GET',
            'callback' => [$this, 'get_player_stats'],
            'permission_callback' => [$this, 'check_auth'],
        ]);
    }

    /**
     * Check if user is authenticated
     */
    public function check_auth($request) {
        return is_user_logged_in();
    }

    /**
     * Get a scenario by ID
     */
    public function get_scenario($request) {
        global $wpdb;
        $id = $request->get_param('id');
        $scenario = $wpdb->get_row(
            $wpdb->prepare("SELECT * FROM {$this->table_scenarios} WHERE id = %d", $id),
            ARRAY_A
        );

        if (!$scenario) {
            return new WP_Error('not_found', 'Scenario not found', ['status' => 404]);
        }

        return rest_ensure_response($scenario);
    }

    /**
     * Make a decision on a scenario
     */
    public function make_decision($request) {
        global $wpdb;
        $user_id = get_current_user_id();
        $scenario_id = $request->get_param('scenario_id');
        $mode = $request->get_param('mode'); // 'easy' or 'hard'
        $choice = $request->get_param('choice');
        $reasoning = $request->get_param('reasoning');

        // Get or create player
        $player = $this->get_or_create_player($user_id);

        // Calculate CTRM score based on mode and choice
        $scorer = new WoR_CTRMScorer();
        $ct rm_score = $scorer->calculate($scenario_id, $mode, $choice, $reasoning);

        // Insert decision
        $wpdb->insert($this->table_decisions, [
            'player_id' => $player['id'],
            'scenario_id' => $scenario_id,
            'mode' => $mode,
            'choice' => $choice,
            'reasoning' => $reasoning,
            'ct rm_score' => $ct rm_score,
        ]);

        $decision_id = $wpdb->insert_id;

        // Update player CTRM total
        $wpdb->query($wpdb->prepare(
            "UPDATE {$this->table_players} SET ct rm_total = ct rm_total + %f WHERE id = %d",
            $ct rm_score, $player['id']
        ));

        // Create spark (unverified)
        $wpdb->insert($this->table_sparks, [
            'decision_id' => $decision_id,
            'verified' => 0,
            'verification_type' => $mode === 'hard' ? 'peer_review' : 'algorithmic',
        ]);

        return rest_ensure_response([
            'success' => true,
            'decision_id' => $decision_id,
            'ct rm_score' => $ct rm_score,
            'spark_created' => true,
        ]);
    }

    /**
     * Get or create a player record
     */
    private function get_or_create_player($user_id) {
        global $wpdb;
        $player = $wpdb->get_row(
            $wpdb->prepare("SELECT * FROM {$this->table_players} WHERE user_id = %d", $user_id),
            ARRAY_A
        );

        if (!$player) {
            $wpdb->insert($this->table_players, [
                'user_id' => $user_id,
                'node_id' => get_option('geoos_node_id', 'local'),
            ]);
            $player = [
                'id' => $wpdb->insert_id,
                'user_id' => $user_id,
            ];
        }

        return $player;
    }

    /**
     * Get current player stats
     */
    public function get_player_stats($request) {
        global $wpdb;
        $user_id = get_current_user_id();
        $player = $this->get_or_create_player($user_id);

        $decisions_count = $wpdb->get_var(
            $wpdb->prepare("SELECT COUNT(*) FROM {$this->table_decisions} WHERE player_id = %d", $player['id'])
        );

        return rest_ensure_response([
            'ct rm_total' => floatval($player['ct rm_total'] ?? 0),
            'tms_level' => intval($player['tms_level'] ?? 1),
            'sparks_released' => intval($player['sparks_released'] ?? 0),
            'decisions_count' => intval($decisions_count),
            'sefirah_primary' => $player['sefirah_primary'] ?? 'chesed',
        ]);
    }
}
```

**Step 3: Create CTRM Scorer class**

```php
<?php
/**
 * CTRM Scorer for World of Rectification
 *
 * Calculates Cognitive Transparent Reasoning Model scores
 * based on player decisions.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_CTRMScorer {

    /**
     * Base scores for Sefirot alignment
     */
    private $sefirah_weights = [
        'chochmah' => 1.5,  // Wisdom
        'binah' => 1.4,     // Understanding
        'daat' => 1.3,      // Knowledge
        'chesed' => 1.2,    // Kindness
        'gevurah' => 1.2,   // Strength
        'tiferet' => 1.3,   // Beauty
        'netzach' => 1.1,   // Victory
        'hod' => 1.1,       // Splendor
        'yesod' => 1.0,     // Foundation
        'malchut' => 1.5,   // Sovereignty
    ];

    /**
     * Calculate CTRM score for a decision
     *
     * @param int $scenario_id The scenario ID
     * @param string $mode 'easy' or 'hard'
     * @param string $choice The player's choice
     * @param string $reasoning Optional reasoning (for hard mode)
     * @return float The CTRM score
     */
    public function calculate($scenario_id, $mode, $choice, $reasoning = null) {
        global $wpdb;

        // Get scenario
        $scenario = $wpdb->get_row(
            $wpdb->prepare(
                "SELECT * FROM {$wpdb->prefix}wor_scenarios WHERE id = %d",
                $scenario_id
            ),
            ARRAY_A
        );

        if (!$scenario) {
            return 0.0;
        }

        $base_score = floatval($scenario['ct rm_weight'] ?? 1.0);
        $sefirah = $scenario['sefirah'] ?? 'chesed';
        $sefirah_multiplier = $this->sefirah_weights[$sefirah] ?? 1.0;

        // Mode multiplier: hard mode earns more
        $mode_multiplier = $mode === 'hard' ? 2.5 : 1.0;

        // Reasoning bonus (for hard mode)
        $reasoning_bonus = 0.0;
        if ($mode === 'hard' && !empty($reasoning)) {
            $reasoning_bonus = $this->analyze_reasoning($reasoning);
        }

        // Calculate final score
        $score = $base_score * $sefirah_multiplier * $mode_multiplier + $reasoning_bonus;

        // Notify TMS via ai-publisher.php
        $this->notify_tms($scenario_id, $mode, $choice, $score);

        return round($score, 2);
    }

    /**
     * Analyze reasoning for bonus points
     */
    private function analyze_reasoning($reasoning) {
        // Simple heuristic: longer, more thoughtful reasoning earns more
        $word_count = str_word_count($reasoning);

        // Check for stewardship keywords
        $keywords = ['steward', 'earth', 'community', 'help', 'repair', 'restore', 'care', 'sustain'];
        $keyword_count = 0;
        foreach ($keywords as $keyword) {
            if (stripos($reasoning, $keyword) !== false) {
                $keyword_count++;
            }
        }

        $bonus = min($word_count / 100, 1.0) + ($keyword_count * 0.1);
        return round($bonus, 2);
    }

    /**
     * Notify TMS via ai-publisher.php
     */
    private function notify_tms($scenario_id, $mode, $choice, $score) {
        $payload = [
            'action' => 'logGameDecision',
            'scenario_id' => $scenario_id,
            'mode' => $mode,
            'choice' => $choice,
            'ct rm_score' => $score,
            'timestamp' => time(),
        ];

        wp_remote_post(home_url('/ai-publisher.php'), [
            'body' => json_encode($payload),
            'headers' => ['Content-Type' => 'application/json'],
            'timeout' => 5,
        ]);
    }
}
```

**Step 4: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/
git commit -m "feat(wor): create World of Rectification plugin foundation

- Add main plugin file with activation hooks
- Add WoR_GameEngine class for game logic
- Add WoR_CTRMScorer for CTRM scoring
- Create database tables for scenarios, decisions, players, sparks
- Register REST API endpoints for game actions"
```

---

## Phase 2: CTRM/TMS Integration

### Task 2: Extend ai-publisher.php with Game Actions

**Files:**
- Modify: `wordpress_zone/wordpress/ai-publisher.php` (add after line 136)

**Step 1: Add game action cases to switch statement**

Add after line 136 (before `default:`) in ai-publisher.php:

```php
    // World of Rectification Game Actions
    case 'logGameDecision':
        handle_log_game_decision($args);
        break;

    case 'getPlayerCTRM':
        handle_get_player_ctrm($args);
        break;

    case 'syncGameNodes':
        handle_sync_game_nodes($args);
        break;

    case 'verifySpark':
        handle_verify_spark($args);
        break;
```

**Step 2: Add handler functions (after line 300)**

```php
/**
 * ─────────────────────────────────────────────────────────────
 * World of Rectification Handlers
 * ─────────────────────────────────────────────────────────────
 */

/**
 * Handle logging a game decision to TMS
 */
function handle_log_game_decision($data) {
    $scenario_id = intval($data['scenario_id'] ?? 0);
    $mode = sanitize_text_field($data['mode'] ?? 'easy');
    $choice = sanitize_textarea_field($data['choice'] ?? '');
    $ct rm_score = floatval($data['ct rm_score'] ?? 0);

    // Create TMS truth entry from decision
    $post_data = [
        'post_title'   => "Game Decision: Scenario $scenario_id ($mode mode)",
        'post_content' => wp_json_encode([
            'scenario_id' => $scenario_id,
            'mode' => $mode,
            'choice' => $choice,
            'ct rm_score' => $ct rm_score,
            'timestamp' => time(),
        ], JSON_PRETTY_PRINT),
        'post_status'  => 'publish',
        'post_author'  => 1,
        'post_type'    => 'post',
    ];

    $post_id = wp_insert_post($post_data);

    if (is_wp_error($post_id)) {
        echo json_encode(['success' => false, 'error' => $post_id->get_error_message()]);
        return;
    }

    // Add CTRM metadata
    add_post_meta($post_id, 'wor_decision', 1);
    add_post_meta($post_id, 'ct rm_score', $ct rm_score);
    add_post_meta($post_id, 'decision_mode', $mode);

    // Notify Visual Bridge
    notify_visual_bridge('WOR_DECISION', "decision-$post_id", 'WoR', [$mode]);

    echo json_encode([
        'success' => true,
        'post_id' => $post_id,
        'ct rm_score' => $ct rm_score,
        'tms_logged' => true,
    ]);
}

/**
 * Get player CTRM stats
 */
function handle_get_player_ctrm($data) {
    $user_id = intval($data['user_id'] ?? get_current_user_id());

    global $wpdb;
    $player = $wpdb->get_row(
        $wpdb->prepare("SELECT * FROM {$wpdb->prefix}wor_players WHERE user_id = %d", $user_id),
        ARRAY_A
    );

    if (!$player) {
        echo json_encode(['success' => false, 'error' => 'Player not found']);
        return;
    }

    // Calculate TMS level based on CTRM score
    $tms_level = $this->calculate_tms_level(floatval($player['ct rm_total']));

    echo json_encode([
        'success' => true,
        'user_id' => $user_id,
        'ct rm_total' => floatval($player['ct rm_total']),
        'tms_level' => $tms_level,
        'sparks_released' => intval($player['sparks_released']),
        'sefirah_primary' => $player['sefirah_primary'],
    ]);
}

/**
 * Sync game data across nodes
 */
function handle_sync_game_nodes($data) {
    $since = intval($data['since'] ?? 0);

    global $wpdb;

    // Get decisions since timestamp
    $decisions = $wpdb->get_results(
        $wpdb->prepare(
            "SELECT * FROM {$wpdb->prefix}wor_decisions WHERE created_at > FROM_UNIXTIME(%d) ORDER BY created_at DESC LIMIT 100",
            $since
        ),
        ARRAY_A
    );

    // Get scenarios
    $scenarios = $wpdb->get_results(
        "SELECT * FROM {$wpdb->prefix}wor_scenarios ORDER BY created_at DESC LIMIT 50",
        ARRAY_A
    );

    echo json_encode([
        'success' => true,
        'decisions' => $decisions,
        'scenarios' => $scenarios,
        'sync_time' => time(),
    ]);
}

/**
 * Verify a spark (peer review or algorithmic)
 */
function handle_verify_spark($data) {
    $spark_id = intval($data['spark_id'] ?? 0);
    $verified = intval($data['verified'] ?? 1);
    $verifier_id = intval($data['verifier_id'] ?? get_current_user_id());

    global $wpdb;

    // Update spark verification status
    $updated = $wpdb->update(
        $wpdb->prefix . 'wor_sparks',
        [
            'verified' => $verified,
            'verification_type' => 'peer_review',
        ],
        ['id' => $spark_id]
    );

    if ($updated === false) {
        echo json_encode(['success' => false, 'error' => 'Failed to verify spark']);
        return;
    }

    // If verified, award Tzedakah credits
    if ($verified) {
        $spark = $wpdb->get_row(
            $wpdb->prepare("SELECT * FROM {$wpdb->prefix}wor_sparks WHERE id = %d", $spark_id),
            ARRAY_A
        );

        $credits = 10.0; // Base credits per verified spark

        $wpdb->update(
            $wpdb->prefix . 'wor_sparks',
            ['tzedakah_credits' => $credits],
            ['id' => $spark_id]
        );

        // Update player sparks count
        $decision = $wpdb->get_row(
            $wpdb->prepare("SELECT player_id FROM {$wpdb->prefix}wor_decisions WHERE id = %d", $spark['decision_id']),
            ARRAY_A
        );

        if ($decision) {
            $wpdb->query($wpdb->prepare(
                "UPDATE {$wpdb->prefix}wor_players SET sparks_released = sparks_released + 1 WHERE id = %d",
                $decision['player_id']
            ));
        }
    }

    echo json_encode([
        'success' => true,
        'spark_id' => $spark_id,
        'verified' => (bool) $verified,
        'tzedakah_credits' => $verified ? $credits : 0,
    ]);
}

/**
 * Calculate TMS level from CTRM score
 */
function calculate_tms_level($ct rm_score) {
    if ($ct rm_score >= 1000) return 10; // GEMS eligible
    if ($ct rm_score >= 500) return 8;
    if ($ct rm_score >= 250) return 6;
    if ($ct rm_score >= 100) return 4;
    if ($ct rm_score >= 50) return 3;
    if ($ct rm_score >= 25) return 2;
    return 1;
}
```

**Step 3: Update handle_list_tools function**

Find the `handle_list_tools` function and add WoR tools:

```php
function handle_list_tools() {
    echo json_encode(array(
        'success' => true,
        'tools' => array(
            // Original tools
            'createPost',
            'editPage',
            'logEvolution',
            'updateArchitecture',
            // CTRM/TMS Integration
            'logTruth',
            'syncTruths',
            'getTruthStats',
            'logAnsmoCycle',
            // World of Rectification
            'logGameDecision',
            'getPlayerCTRM',
            'syncGameNodes',
            'verifySpark',
            // Research
            'importResearchDocument',
            'searchResearch',
        ),
        'categories' => array(
            'wor' => array('logGameDecision', 'getPlayerCTRM', 'syncGameNodes', 'verifySpark'),
            'ctrm' => array('logTruth', 'syncTruths', 'getTruthStats'),
            'tms' => array('logAnsmoCycle'),
            'evolution' => array('logEvolution', 'updateArchitecture'),
        )
    ));
}
```

**Step 4: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add wordpress_zone/wordpress/ai-publisher.php
git commit -m "feat(wor): add WoR game actions to ai-publisher.php

- Add logGameDecision handler for TMS logging
- Add getPlayerCTRM handler for stats retrieval
- Add syncGameNodes handler for distributed sync
- Add verifySpark handler for peer review
- Update tool list with WoR category"
```

---

## Phase 3: Sample Scenarios

### Task 3: Seed Initial Scenarios

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/data/seed-scenarios.php`

**Step 1: Create seed data file**

```php
<?php
/**
 * Seed Scenarios for World of Rectification
 *
 * Run this once after activation to populate initial scenarios.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_SeedScenarios {

    public static function run() {
        global $wpdb;
        $table = $wpdb->prefix . 'wor_scenarios';

        $scenarios = [
            [
                'title' => 'The CEO\'s Decision',
                'description' => 'You are the CEO of Planet Earth, Inc. Profits are up 20%, but the manufacturing process is polluting the local river. Shareholders expect continued growth. What do you do?',
                'sefirah' => 'malchut',
                'difficulty_easy' => json_encode([
                    'choices' => [
                        ['text' => 'Stop the pollution immediately, regardless of profit impact', 'correct' => true],
                        ['text' => 'Continue as-is to maximize profits', 'correct' => false],
                    ],
                    'feedback' => 'True stewards protect creation over profit.',
                ]),
                'difficulty_hard' => json_encode([
                    'task' => 'Write a proposal for transitioning to sustainable manufacturing while maintaining profitability.',
                    'contribution_type' => 'content',
                    'requires' => ['proposal', 'reasoning'],
                ]),
                'ct rm_weight' => 1.50,
            ],
            [
                'title' => 'Captain\'s Log: Energy Crisis',
                'description' => 'As Captain of Starship Gaia, energy reserves are at 30%. The crew wants entertainment systems powered. A nearby planet needs emergency supplies. What is your command?',
                'sefirah' => 'gevurah',
                'difficulty_easy' => json_encode([
                    'choices' => [
                        ['text' => 'Divert all available energy to the supply mission', 'correct' => true],
                        ['text' => 'Keep energy for crew morale systems', 'correct' => false],
                    ],
                    'feedback' => 'Captains put the mission above comfort.',
                ]),
                'difficulty_hard' => json_encode([
                    'task' => 'Design an energy allocation protocol for multi-crew missions.',
                    'contribution_type' => 'code',
                    'requires' => ['protocol_design', 'logic_flow'],
                ]),
                'ct rm_weight' => 1.25,
            ],
            [
                'title' => 'The Forest Guardian\'s Choice',
                'description' => 'A developer wants to build a shopping center on an old-growth forest. The community is divided - jobs vs. nature. As Forest Guardian, what path do you recommend?',
                'sefirah' => 'tiferet',
                'difficulty_easy' => json_encode([
                    'choices' => [
                        ['text' => 'Protect the forest - nature cannot be replaced', 'correct' => true],
                        ['text' => 'Allow development - jobs are needed', 'correct' => false],
                    ],
                    'feedback' => 'Beauty and nature are irreplaceable treasures.',
                ]),
                'difficulty_hard' => json_encode([
                    'task' => 'Research and propose alternative locations or sustainable development approaches.',
                    'contribution_type' => 'research',
                    'requires' => ['alternatives', 'sustainability_analysis'],
                ]),
                'ct rm_weight' => 1.35,
            ],
            [
                'title' => 'The Mayor\'s Budget',
                'description' => 'City budget surplus of $1M. Options: Build a new park, repair aging infrastructure, or create a job training program. Each benefits different groups. Choose wisely.',
                'sefirah' => 'chesed',
                'difficulty_easy' => json_encode([
                    'choices' => [
                        ['text' => 'Job training program - invests in people\'s futures', 'correct' => true],
                        ['text' => 'New park - beautifies the city', 'correct' => false],
                        ['text' => 'Infrastructure - maintains what we have', 'correct' => false],
                    ],
                    'feedback' => 'Investing in people creates lasting change.',
                ]),
                'difficulty_hard' => json_encode([
                    'task' => 'Create a balanced budget proposal that addresses multiple needs.',
                    'contribution_type' => 'planning',
                    'requires' => ['budget_allocation', 'stakeholder_analysis'],
                ]),
                'ct rm_weight' => 1.20,
            ],
            [
                'title' => 'The Nurturer\'s Visit',
                'description' => 'An elderly neighbor has been alone for weeks. You have limited time today. Do you visit, even though it means delaying your own tasks?',
                'sefirah' => 'chesed',
                'difficulty_easy' => json_encode([
                    'choices' => [
                        ['text' => 'Visit immediately - connection matters most', 'correct' => true],
                        ['text' => 'Schedule for later - your tasks are important too', 'correct' => false],
                    ],
                    'feedback' => 'Kindness shown is kindness grown.',
                ]),
                'difficulty_hard' => json_encode([
                    'task' => 'Design a community care network system for connecting isolated individuals.',
                    'contribution_type' => 'system_design',
                    'requires' => ['network_architecture', 'verification_methods'],
                ]),
                'ct rm_weight' => 1.00,
            ],
        ];

        foreach ($scenarios as $scenario) {
            $wpdb->insert($table, $scenario);
        }

        return count($scenarios);
    }
}
```

**Step 2: Add activation hook to run seeder**

Add to `world-of-rectification.php` after the `wor_activate` function:

```php
function wor_activate() {
    require_once WOR_PLUGIN_DIR . 'includes/class-game-engine.php';
    $engine = new WoR_GameEngine();
    $engine->create_tables();

    // Seed initial scenarios
    require_once WOR_PLUGIN_DIR . 'data/seed-scenarios.php';
    WoR_SeedScenarios::run();
}
```

**Step 3: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/
git commit -m "feat(wor): add seed scenarios for initial game content

- Add 5 initial scenarios across different Sefirot
- Include easy mode choices with correct answers
- Include hard mode contribution tasks
- Auto-seed on plugin activation"
```

---

## Phase 4: Frontend Interface

### Task 4: Create Game Shortcode and Frontend

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-frontend.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/assets/css/wor-frontend.css`
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/assets/js/wor-game.js`

**Step 1: Create frontend class**

```php
<?php
/**
 * World of Rectification Frontend
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_Frontend {

    public function init() {
        add_shortcode('world_of_rectification', [$this, 'render_game']);
        add_action('wp_enqueue_scripts', [$this, 'enqueue_assets']);
    }

    public function enqueue_assets() {
        wp_enqueue_style(
            'wor-frontend',
            WOR_PLUGIN_URL . 'assets/css/wor-frontend.css',
            [],
            WOR_VERSION
        );

        wp_enqueue_script(
            'wor-game',
            WOR_PLUGIN_URL . 'assets/js/wor-game.js',
            ['jquery'],
            WOR_VERSION,
            true
        );

        wp_localize_script('wor-game', 'worData', [
            'restUrl' => rest_url('wor/v1'),
            'nonce' => wp_create_nonce('wp_rest'),
            'isLoggedIn' => is_user_logged_in(),
        ]);
    }

    public function render_game($atts) {
        $atts = shortcode_atts([
            'scenario' => null,
        ], $atts);

        global $wpdb;

        // Get scenarios
        $scenarios = $wpdb->get_results(
            "SELECT id, title, description, sefirah FROM {$wpdb->prefix}wor_scenarios ORDER BY RAND() LIMIT 10",
            ARRAY_A
        );

        // Get player stats if logged in
        $player_stats = null;
        if (is_user_logged_in()) {
            $user_id = get_current_user_id();
            $player = $wpdb->get_row(
                $wpdb->prepare("SELECT * FROM {$wpdb->prefix}wor_players WHERE user_id = %d", $user_id),
                ARRAY_A
            );
            if ($player) {
                $player_stats = $player;
            }
        }

        ob_start();
        ?>
        <div id="wor-game-container" class="wor-container">
            <!-- Player Stats Panel -->
            <div class="wor-player-panel">
                <h3>Your Journey</h3>
                <?php if ($player_stats): ?>
                    <div class="wor-stat">
                        <span class="wor-stat-label">CTRM Score:</span>
                        <span class="wor-stat-value"><?php echo esc_html($player_stats['ct rm_total']); ?></span>
                    </div>
                    <div class="wor-stat">
                        <span class="wor-stat-label">TMS Level:</span>
                        <span class="wor-stat-value"><?php echo esc_html($player_stats['tms_level']); ?></span>
                    </div>
                    <div class="wor-stat">
                        <span class="wor-stat-label">Sparks Released:</span>
                        <span class="wor-stat-value"><?php echo esc_html($player_stats['sparks_released']); ?></span>
                    </div>
                    <div class="wor-stat">
                        <span class="wor-stat-label">Primary Sefirah:</span>
                        <span class="wor-stat-value wor-sefirah-<?php echo esc_attr($player_stats['sefirah_primary']); ?>">
                            <?php echo esc_html(ucfirst($player_stats['sefirah_primary'])); ?>
                        </span>
                    </div>
                <?php else: ?>
                    <p class="wor-login-prompt">
                        <a href="<?php echo wp_login_url(get_permalink()); ?>">Log in</a> to track your progress and earn CTRM scores.
                    </p>
                <?php endif; ?>
            </div>

            <!-- Scenario Display -->
            <div class="wor-scenario-panel">
                <div id="wor-scenarios">
                    <?php foreach ($scenarios as $index => $scenario): ?>
                        <div class="wor-scenario" data-id="<?php echo esc_attr($scenario['id']); ?>" <?php echo $index > 0 ? 'style="display:none;"' : ''; ?>>
                            <div class="wor-scenario-header">
                                <span class="wor-sefirah-badge wor-sefirah-<?php echo esc_attr($scenario['sefirah']); ?>">
                                    <?php echo esc_html(ucfirst($scenario['sefirah'])); ?>
                                </span>
                                <h2 class="wor-scenario-title"><?php echo esc_html($scenario['title']); ?></h2>
                            </div>
                            <p class="wor-scenario-description"><?php echo esc_html($scenario['description']); ?></p>

                            <!-- Mode Selection -->
                            <div class="wor-mode-selection">
                                <p>Choose your path:</p>
                                <button class="wor-mode-btn wor-mode-easy" data-mode="easy">
                                    Easy Mode - Obvious Choice
                                </button>
                                <button class="wor-mode-btn wor-mode-hard" data-mode="hard">
                                    Hard Mode - Contribute to Geometry OS
                                </button>
                            </div>

                            <!-- Decision Form (loaded via JS) -->
                            <div class="wor-decision-form" style="display:none;"></div>
                        </div>
                    <?php endforeach; ?>
                </div>

                <!-- Navigation -->
                <div class="wor-navigation">
                    <button id="wor-prev-scenario" class="wor-nav-btn" disabled>Previous</button>
                    <span id="wor-scenario-counter">1 / <?php echo count($scenarios); ?></span>
                    <button id="wor-next-scenario" class="wor-nav-btn">Next</button>
                </div>
            </div>

            <!-- World Health Meter -->
            <div class="wor-world-meter">
                <h4>World Health</h4>
                <div class="wor-meter-bar">
                    <div class="wor-meter-fill" style="width: 42%;"></div>
                </div>
                <span class="wor-meter-label">42% Restored</span>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }
}
```

**Step 2: Create CSS**

```css
/* World of Rectification Frontend Styles */

.wor-container {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.wor-player-panel {
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
    color: #fff;
    padding: 20px;
    border-radius: 12px;
    margin-bottom: 20px;
}

.wor-player-panel h3 {
    margin-top: 0;
    color: #00d9ff;
}

.wor-stat {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.wor-stat-value {
    font-weight: bold;
    color: #00ff88;
}

/* Sefirah Colors */
.wor-sefirah-chesed { color: #00bfff; }
.wor-sefirah-gevurah { color: #ff4444; }
.wor-sefirah-tiferet { color: #ffaa00; }
.wor-sefirah-malchut { color: #aa44ff; }
.wor-sefirah-chochmah { color: #ffffff; }
.wor-sefirah-binah { color: #8888ff; }

.wor-scenario-panel {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.wor-scenario-header {
    text-align: center;
    margin-bottom: 20px;
}

.wor-sefirah-badge {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    text-transform: uppercase;
    background: rgba(0,0,0,0.1);
    margin-bottom: 10px;
}

.wor-scenario-title {
    font-size: 24px;
    margin: 10px 0;
}

.wor-scenario-description {
    font-size: 16px;
    line-height: 1.6;
    color: #444;
    margin-bottom: 30px;
}

.wor-mode-selection {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}

.wor-mode-btn {
    flex: 1;
    min-width: 200px;
    padding: 15px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    transition: all 0.3s ease;
}

.wor-mode-easy {
    background: #e8f5e9;
    color: #2e7d32;
    border: 2px solid #4caf50;
}

.wor-mode-easy:hover {
    background: #c8e6c9;
}

.wor-mode-hard {
    background: #fff3e0;
    color: #e65100;
    border: 2px solid #ff9800;
}

.wor-mode-hard:hover {
    background: #ffe0b2;
}

.wor-navigation {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #eee;
}

.wor-nav-btn {
    padding: 10px 20px;
    background: #1976d2;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.wor-nav-btn:disabled {
    background: #ccc;
    cursor: not-allowed;
}

.wor-world-meter {
    background: linear-gradient(135deg, #0d4f3c 0%, #1a6b4f 100%);
    color: #fff;
    padding: 20px;
    border-radius: 12px;
    margin-top: 20px;
    text-align: center;
}

.wor-meter-bar {
    height: 20px;
    background: rgba(255,255,255,0.2);
    border-radius: 10px;
    overflow: hidden;
    margin: 10px 0;
}

.wor-meter-fill {
    height: 100%;
    background: linear-gradient(90deg, #00ff88, #00ffcc);
    transition: width 0.5s ease;
}

.wor-login-prompt a {
    color: #00d9ff;
}
```

**Step 3: Create JavaScript**

```javascript
/**
 * World of Rectification Game JS
 */
(function($) {
    'use strict';

    let currentScenario = 0;
    let scenarios = [];

    $(document).ready(function() {
        scenarios = $('.wor-scenario');
        initNavigation();
        initModeSelection();
    });

    function initNavigation() {
        $('#wor-prev-scenario').on('click', function() {
            if (currentScenario > 0) {
                showScenario(currentScenario - 1);
            }
        });

        $('#wor-next-scenario').on('click', function() {
            if (currentScenario < scenarios.length - 1) {
                showScenario(currentScenario + 1);
            }
        });
    }

    function showScenario(index) {
        scenarios.hide();
        $(scenarios[index]).show();
        currentScenario = index;

        $('#wor-scenario-counter').text(`${index + 1} / ${scenarios.length}`);
        $('#wor-prev-scenario').prop('disabled', index === 0);
        $('#wor-next-scenario').prop('disabled', index === scenarios.length - 1);

        // Reset decision form
        $('.wor-decision-form').hide();
        $('.wor-mode-selection').show();
    }

    function initModeSelection() {
        $('.wor-mode-easy').on('click', function() {
            const scenarioId = $(this).closest('.wor-scenario').data('id');
            loadEasyMode(scenarioId);
        });

        $('.wor-mode-hard').on('click', function() {
            const scenarioId = $(this).closest('.wor-scenario').data('id');
            loadHardMode(scenarioId);
        });
    }

    function loadEasyMode(scenarioId) {
        $.get(worData.restUrl + '/scenario/' + scenarioId, function(data) {
            const form = $('.wor-decision-form');
            const easyData = JSON.parse(data.difficulty_easy);

            let html = '<h4>Easy Mode - Choose Wisely</h4>';
            html += '<div class="wor-choices">';
            easyData.choices.forEach((choice, i) => {
                html += `<button class="wor-choice-btn" data-correct="${choice.correct}" data-scenario="${scenarioId}" data-mode="easy">
                    ${choice.text}
                </button>`;
            });
            html += '</div>';

            form.html(html).show();
            $('.wor-mode-selection').hide();

            initChoiceButtons();
        });
    }

    function loadHardMode(scenarioId) {
        const form = $('.wor-decision-form');

        let html = '<h4>Hard Mode - Contribute to Geometry OS</h4>';
        html += '<p class="wor-hard-info">Your contribution will help build the game engine itself.</p>';
        html += '<textarea id="wor-reasoning" placeholder="Explain your reasoning and proposed solution..." rows="6"></textarea>';
        html += '<textarea id="wor-contribution" placeholder="Your contribution (proposal, code, research, etc.)..." rows="6"></textarea>';
        html += `<button class="wor-submit-btn" data-scenario="${scenarioId}" data-mode="hard">Submit Contribution</button>`;

        form.html(html).show();
        $('.wor-mode-selection').hide();

        initHardModeSubmit();
    }

    function initChoiceButtons() {
        $('.wor-choice-btn').on('click', function() {
            const correct = $(this).data('correct') === true;
            const scenarioId = $(this).data('scenario');
            const choice = $(this).text();

            submitDecision(scenarioId, 'easy', choice, null);
        });
    }

    function initHardModeSubmit() {
        $('.wor-submit-btn').on('click', function() {
            const scenarioId = $(this).data('scenario');
            const reasoning = $('#wor-reasoning').val();
            const contribution = $('#wor-contribution').val();

            if (!reasoning || !contribution) {
                alert('Please fill in both fields for hard mode.');
                return;
            }

            submitDecision(scenarioId, 'hard', contribution, reasoning);
        });
    }

    function submitDecision(scenarioId, mode, choice, reasoning) {
        if (!worData.isLoggedIn) {
            alert('Please log in to save your decisions.');
            return;
        }

        $.ajax({
            url: worData.restUrl + '/decide',
            method: 'POST',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-WP-Nonce', worData.nonce);
            },
            data: JSON.stringify({
                scenario_id: scenarioId,
                mode: mode,
                choice: choice,
                reasoning: reasoning
            }),
            contentType: 'application/json',
            success: function(response) {
                showResult(response);
            },
            error: function() {
                alert('Error submitting decision. Please try again.');
            }
        });
    }

    function showResult(response) {
        const form = $('.wor-decision-form');
        let html = '<div class="wor-result">';
        html += `<div class="wor-result-icon">✨</div>`;
        html += `<h4>Spark Released!</h4>`;
        html += `<p>You earned ${response.ct rm_score} CTRM points.</p>`;
        html += '<button class="wor-continue-btn">Continue</button>';
        html += '</div>';

        form.html(html);

        $('.wor-continue-btn').on('click', function() {
            if (currentScenario < scenarios.length - 1) {
                showScenario(currentScenario + 1);
            }
        });
    }

})(jQuery);
```

**Step 4: Add frontend class to main plugin**

Add to `world-of-rectification.php`:

```php
require_once WOR_PLUGIN_DIR . 'includes/class-frontend.php';

function wor_init() {
    $game_engine = new WoR_GameEngine();
    $game_engine->init();

    $frontend = new WoR_Frontend();
    $frontend->init();
}
```

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
mkdir -p wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/assets/css
mkdir -p wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/assets/js
mkdir -p wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/data
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/
git commit -m "feat(wor): add frontend shortcode and game interface

- Add [world_of_rectification] shortcode
- Create responsive game UI with scenario display
- Add easy/hard mode selection buttons
- Add JavaScript for AJAX decision submission
- Add player stats panel and world health meter
- Include sefirah-based color coding"
```

---

## Phase 5: Node Sync Integration

### Task 5: Integrate with geometry-os-swarm-node

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-swarm-node/geometry-os-swarm-node.php`

**Step 1: Add WoR sync endpoint to swarm node**

Add to `register_routes()` in geometry-os-swarm-node.php:

```php
        // World of Rectification game sync
        register_rest_route('geoos/v1', '/wor/sync', [
            'methods' => 'GET',
            'callback' => [$this, 'api_wor_sync'],
            'permission_callback' => '__return_true'
        ]);
```

**Step 2: Add sync handler method**

Add after `api_sync()` method:

```php
    /**
     * GET /wp-json/geoos/v1/wor/sync - Sync WoR game data
     */
    public function api_wor_sync($request): array {
        $since = intval($request->get_param('since') ?? 0);
        $limit = min(intval($request->get_param('limit') ?? 100), 500);

        global $wpdb;

        // Sync scenarios
        $scenarios = $wpdb->get_results(
            $wpdb->prepare(
                "SELECT * FROM {$wpdb->prefix}wor_scenarios WHERE created_at > FROM_UNIXTIME(%d) ORDER BY created_at DESC LIMIT %d",
                $since, $limit
            ),
            ARRAY_A
        );

        // Sync player stats (anonymized)
        $players = $wpdb->get_results(
            "SELECT node_id, sefirah_primary, ct rm_total, tms_level, sparks_released
             FROM {$wpdb->prefix}wor_players
             WHERE node_id IS NOT NULL
             ORDER BY ct rm_total DESC
             LIMIT 100",
            ARRAY_A
        );

        // Sync global stats
        $global_stats = [
            'total_sparks' => $wpdb->get_var("SELECT COUNT(*) FROM {$wpdb->prefix}wor_sparks WHERE verified = 1"),
            'total_ct rm' => $wpdb->get_var("SELECT SUM(ct rm_total) FROM {$wpdb->prefix}wor_players"),
            'total_players' => $wpdb->get_var("SELECT COUNT(*) FROM {$wpdb->prefix}wor_players"),
        ];

        return [
            'node_id' => $this->node_id,
            'scenarios' => $scenarios,
            'players' => $players,
            'global_stats' => $global_stats,
            'sync_time' => time(),
        ];
    }
```

**Step 3: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-swarm-node/geometry-os-swarm-node.php
git commit -m "feat(swarm): add WoR sync endpoint for distributed game nodes

- Add /wor/sync endpoint for game data sync
- Include scenarios, anonymized player stats, global stats
- Enable local WordPress nodes to sync game state"
```

---

## Summary

| Phase | Tasks | Files Created/Modified |
|-------|-------|------------------------|
| 1. Foundation | Plugin structure, database tables | `world-of-rectification.php`, `class-game-engine.php`, `class-ct rm-scorer.php` |
| 2. CTRM/TMS | ai-publisher.php integration | `ai-publisher.php` (modified) |
| 3. Scenarios | Seed data | `seed-scenarios.php` |
| 4. Frontend | Shortcode, CSS, JS | `class-frontend.php`, CSS, JS files |
| 5. Sync | Swarm node integration | `geometry-os-swarm-node.php` (modified) |

---

## Usage

1. **Activate the plugin** in WordPress admin
2. **Add the shortcode** `[world_of_rectification]` to any page
3. **Players log in** to track CTRM scores
4. **Easy mode** = obvious choices, base CTRM
5. **Hard mode** = contribute to Geometry OS, 2.5x CTRM
6. **Local nodes** sync via `/wp-json/geoos/v1/wor/sync`

---

## Next Steps After This Plan

1. **AR Integration** - Add Niantic Lightship for real-world quests
2. **Blockchain Credits** - Implement Tzedakah Credits on MultiChain
3. **GEMS Pipeline** - Build Global Emergency Management System
4. **Sefirot Specialization** - Deep skill trees per attribute
5. **Verification Engine** - Peer review system for hard mode contributions
