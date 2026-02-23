# Scribe Protocol Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add expert-in-the-loop mentorship system to World of Rectification where Scribes learn, teach Sprouts, and generate AI training data through logged chat sessions.

**Architecture:** WordPress plugin extension with three new components: ScribePortal (cohort-based onboarding), TransmissionSession (real-time chat with polling), and MentorDataPipeline (intent classification & AI training export). Integrates with existing Visual Bridge WebSocket for real-time notifications.

**Tech Stack:** PHP 8.x, WordPress 6.x, MySQL/MariaDB, jQuery/AJAX, existing WoR plugin infrastructure

---

## Phase 1: Database Schema

### Task 1.1: Create Scribe Tables

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php`
- Test: Manual verification via phpMyAdmin or WP CLI

**Step 1: Add table creation to GameEngine class**

In `class-game-engine.php`, add new table definitions to the `create_tables()` method:

```php
// Add after the existing $sql_sparks definition

$sql_scribes = "CREATE TABLE {$wpdb->prefix}wor_scribes (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    user_id BIGINT(20) NOT NULL,
    cohort ENUM('internal', 'community', 'domain_expert') NOT NULL DEFAULT 'community',
    expertise_tags JSON,
    onboarding_completed TINYINT(1) DEFAULT 0,
    onboarding_step INT DEFAULT 0,
    mentorship_count INT DEFAULT 0,
    avg_sprout_rating DECIMAL(3,2) DEFAULT NULL,
    ghost_training_eligible TINYINT(1) DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY user_id (user_id)
) {$charset_collate};";

$sql_sprouts = "CREATE TABLE {$wpdb->prefix}wor_sprouts (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    user_id BIGINT(20) NOT NULL,
    primary_sefirah VARCHAR(50) DEFAULT NULL,
    current_quest_id BIGINT(20) DEFAULT NULL,
    assigned_scribe_id BIGINT(20) DEFAULT NULL,
    total_sessions INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY user_id (user_id),
    KEY assigned_scribe_id (assigned_scribe_id)
) {$charset_collate};";

$sql_transmissions = "CREATE TABLE {$wpdb->prefix}wor_transmissions (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    scribe_id BIGINT(20) NOT NULL,
    sprout_id BIGINT(20) NOT NULL,
    quest_context_id BIGINT(20) DEFAULT NULL,
    status ENUM('active', 'completed', 'abandoned') DEFAULT 'active',
    started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    ended_at DATETIME DEFAULT NULL,
    duration_seconds INT DEFAULT NULL,
    scribe_rating INT DEFAULT NULL,
    sprout_feedback TEXT,
    PRIMARY KEY (id),
    KEY scribe_id (scribe_id),
    KEY sprout_id (sprout_id),
    KEY status (status)
) {$charset_collate};";

$sql_transmission_messages = "CREATE TABLE {$wpdb->prefix}wor_transmission_messages (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    transmission_id BIGINT(20) NOT NULL,
    sender_type ENUM('scribe', 'sprout', 'system') NOT NULL,
    sender_id BIGINT(20) NOT NULL,
    message_text TEXT NOT NULL,
    intent_label VARCHAR(100) DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY transmission_id (transmission_id)
) {$charset_collate};";

$sql_intent_clusters = "CREATE TABLE {$wpdb->prefix}wor_intent_clusters (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    intent_name VARCHAR(100) NOT NULL,
    description TEXT,
    sample_phrases JSON,
    message_count INT DEFAULT 0,
    accuracy_score DECIMAL(4,3) DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY intent_name (intent_name)
) {$charset_collate};";
```

**Step 2: Add dbDelta calls for new tables**

Add after the existing dbDelta calls:

```php
dbDelta($sql_scribes);
dbDelta($sql_sprouts);
dbDelta($sql_transmissions);
dbDelta($sql_transmission_messages);
dbDelta($sql_intent_clusters);
```

**Step 3: Deactivate and reactivate plugin to create tables**

Run in WordPress admin or via WP CLI:
```bash
wp plugin deactivate world-of-rectification --path=/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress
wp plugin activate world-of-rectification --path=/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress
```

Expected: Tables created successfully

**Step 4: Verify tables exist**

```bash
wp db query "SHOW TABLES LIKE '%wor_scri%'" --path=/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress
```

Expected: `wp_wor_scribes` in output

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php
git commit -m "feat(scribe): add database tables for scribes, sprouts, and transmissions

- Add wor_scribes table with cohort classification
- Add wor_sprouts table for newcomers
- Add wor_transmissions table for session tracking
- Add wor_transmission_messages for chat logging
- Add wor_intent_clusters for AI training data"
```

---

## Phase 2: Scribe Portal Class

### Task 2.1: Create ScribePortal Class Skeleton

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php`

**Step 1: Create the class file with onboarding flow definitions**

```php
<?php
/**
 * World of Rectification - Scribe Portal
 *
 * Handles Scribe registration, onboarding flows, and dashboard.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_ScribePortal {

    private $table_scribes;

    private $onboarding_flows = [
        'internal' => [
            [
                'title' => 'Technical Architecture',
                'type' => 'reading',
                'content' => 'World of Rectification is built as a WordPress plugin with custom database tables. The game uses CTRM (Cognitive Transparent Reasoning Model) scoring and integrates with TMS (Truth Management System). Key files: class-game-engine.php handles scenarios and decisions, class-ctrm-scorer.php calculates scores.'
            ],
            [
                'title' => 'Codebase Walkthrough',
                'type' => 'interactive',
                'url' => '#code-tour'
            ],
            [
                'title' => 'Sample Transmissions',
                'type' => 'review',
                'sessions' => []
            ],
            [
                'title' => 'Ghost Mentor Pipeline',
                'type' => 'reading',
                'content' => 'Ghost Mentors are AI agents trained from your mentorship sessions. Every message you send is classified by intent (explanation, hint, encouragement, etc.) and stored for training. High-quality sessions (rating 3.5+) become training data.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'What is CTRM?',
                        'options' => ['Cognitive Transparent Reasoning Model', 'Computer Training Resource Manager', 'Content Tracking Rating Method'],
                        'correct' => 0
                    ],
                    [
                        'question' => 'What happens to your mentorship messages?',
                        'options' => ['They are deleted after 24 hours', 'They are classified by intent and stored for AI training', 'They are published publicly'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What makes a session eligible for Ghost Mentor training?',
                        'options' => ['Any completed session', 'Sessions with rating 3.5+ stars', 'Sessions longer than 10 minutes'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 80
            ],
        ],
        'community' => [
            [
                'title' => 'What is World of Rectification?',
                'type' => 'reading',
                'content' => 'World of Rectification (WoR) is a game that transforms Tikkun Olam (repairing the world) into an engaging experience. Players discover "sparks" trapped in "husks" and liberate them through acts of rectification. Each decision earns CTRM points.'
            ],
            [
                'title' => 'Tikkun Olam & Sefirot',
                'type' => 'reading',
                'content' => 'The Sefirot are ten attributes through which the Divine interacts with the world. In WoR, each quest aligns with a Sefirah: Chesed (kindness), Gevurah (strength), Tiferet (beauty), etc. Your choices shape which Sefirot you embody.'
            ],
            [
                'title' => 'Practice Scenario',
                'type' => 'simulation',
                'scenario' => 'A player asks: "I chose the easy option but feel guilty. Was that wrong?" How would you respond?'
            ],
            [
                'title' => 'Vibe Coding',
                'type' => 'reading',
                'content' => 'As a Scribe, your explanations become part of the game. When you describe a concept in your own words, you are "vibe coding" - creating the tone and instructional logic that AI will replicate. Be authentic and helpful.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'What is a Spark in WoR?',
                        'options' => ['A fire hazard', 'A trapped element that can be liberated through good choices', 'A type of currency'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What should you do if a Sprout asks about a mechanic you do not know?',
                        'options' => ['Make something up', 'Admit you do not know and help find the answer together', 'Tell them to figure it out'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What is Vibe Coding?',
                        'options' => ['Writing code while dancing', 'Creating instructional tone that AI will replicate', 'A programming language'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 70
            ],
        ],
        'domain_expert' => [
            [
                'title' => 'Your Expertise',
                'type' => 'form',
                'fields' => [
                    ['name' => 'domain', 'label' => 'Your Area of Expertise', 'type' => 'text', 'required' => true],
                    ['name' => 'years', 'label' => 'Years of Experience', 'type' => 'number', 'required' => true],
                    ['name' => 'specialties', 'label' => 'Specialties (comma-separated)', 'type' => 'text', 'required' => false]
                ]
            ],
            [
                'title' => 'WoR + Your Domain',
                'type' => 'reading',
                'content' => 'Your expertise can enrich World of Rectification. Whether you are an educator, theologian, game designer, or other professional - your domain knowledge helps create authentic scenarios and meaningful mentorship moments.'
            ],
            [
                'title' => 'Create Sample Explanation',
                'type' => 'submission',
                'prompt' => 'Imagine a player is stuck on a scenario involving your domain expertise. Write a brief explanation (2-3 sentences) that would help them understand without giving away the answer:'
            ],
            [
                'title' => 'Review Existing Content',
                'type' => 'review',
                'content' => 'Browse the existing scenarios and consider how your expertise might improve them. Note any opportunities for richer, more authentic content.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'How should domain expertise be applied in WoR?',
                        'options' => ['To make content more authentic and meaningful', 'To show off knowledge', 'To make scenarios harder'],
                        'correct' => 0
                    ],
                    [
                        'question' => 'A player asks about something in your domain. You should:',
                        'options' => ['Give a full lecture on the topic', 'Provide just enough context to help them decide', 'Tell them it is irrelevant to the game'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 75
            ],
        ],
    ];

    public function __construct() {
        global $wpdb;
        $this->table_scribes = $wpdb->prefix . 'wor_scribes';
    }

    /**
     * Get onboarding flow for a cohort
     */
    public function get_onboarding_flow(string $cohort): array {
        return $this->onboarding_flows[$cohort] ?? [];
    }

    /**
     * Get scribe by ID
     */
    public function get_scribe(int $scribe_id): ?array {
        global $wpdb;
        return $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE id = %d",
            $scribe_id
        ), ARRAY_A);
    }

    /**
     * Get scribe by WordPress user ID
     */
    public function get_scribe_by_user(int $user_id): ?array {
        global $wpdb;
        return $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE user_id = %d",
            $user_id
        ), ARRAY_A);
    }
}
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php
git commit -m "feat(scribe): create ScribePortal class with onboarding flows

- Add cohort-specific onboarding flows (internal, community, domain_expert)
- Add methods for getting scribe records
- Define quiz questions for certification step"
```

---

### Task 2.2: Add Scribe Registration Method

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php`

**Step 1: Add register_scribe method**

Add to the `WoR_ScribePortal` class after `get_scribe_by_user`:

```php
    /**
     * Register a new Scribe
     */
    public function register_scribe(int $user_id, string $cohort, array $expertise = []): int|false {
        global $wpdb;

        // Check if already registered
        $existing = $this->get_scribe_by_user($user_id);
        if ($existing) {
            return false;
        }

        $result = $wpdb->insert($this->table_scribes, [
            'user_id' => $user_id,
            'cohort' => $cohort,
            'expertise_tags' => json_encode($expertise),
            'onboarding_step' => 0,
            'onboarding_completed' => 0,
        ]);

        if ($result === false) {
            return false;
        }

        $scribe_id = $wpdb->insert_id;

        // Send notification (fire and forget)
        $this->send_onboarding_email($user_id, $cohort);

        return $scribe_id;
    }

    /**
     * Send onboarding welcome email
     */
    private function send_onboarding_email(int $user_id, string $cohort): void {
        $user = get_user_by('id', $user_id);
        if (!$user) {
            return;
        }

        $subject = 'Welcome to WoR Scribes - ' . ucfirst($cohort) . ' Track';

        $messages = [
            'internal' => 'Welcome to the Scribe program! As an internal team member, you will learn the technical architecture and help build the Ghost Mentor training pipeline.',
            'community' => 'Welcome to the Scribe program! As a community volunteer, you will help newcomers discover the joy of Tikkun Olam through gameplay.',
            'domain_expert' => 'Welcome to the Scribe program! Your expertise will help create authentic, meaningful content for players.',
        ];

        $message = $messages[$cohort] ?? 'Welcome to the Scribe program!';

        wp_mail($user->user_email, $subject, $message);
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php
git commit -m "feat(scribe): add register_scribe method with email notification"
```

---

### Task 2.3: Add Onboarding Step Completion

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php`

**Step 1: Add complete_step method**

Add after `send_onboarding_email`:

```php
    /**
     * Complete an onboarding step
     */
    public function complete_step(int $scribe_id, int $step, array $response = []): array {
        global $wpdb;

        $scribe = $this->get_scribe($scribe_id);
        if (!$scribe) {
            return ['error' => 'Scribe not found'];
        }

        $flow = $this->onboarding_flows[$scribe['cohort']] ?? [];

        if ($step < 0 || $step >= count($flow)) {
            return ['error' => 'Invalid step'];
        }

        $step_config = $flow[$step];

        // Handle quiz validation
        if ($step_config['type'] === 'quiz') {
            $quiz_result = $this->grade_quiz($step_config, $response);
            if (!$quiz_result['passed']) {
                return [
                    'error' => 'Quiz not passed',
                    'score' => $quiz_result['score'],
                    'passing_score' => $step_config['passing_score']
                ];
            }
        }

        // Calculate next step
        $new_step = $step + 1;
        $completed = ($new_step >= count($flow));

        // Update database
        $wpdb->update(
            $this->table_scribes,
            [
                'onboarding_step' => $new_step,
                'onboarding_completed' => $completed ? 1 : 0,
                'ghost_training_eligible' => $completed ? 1 : 0,
            ],
            ['id' => $scribe_id]
        );

        return [
            'success' => true,
            'next_step' => $new_step,
            'completed' => $completed,
            'next_content' => $completed ? null : ($flow[$new_step] ?? null),
        ];
    }

    /**
     * Grade a quiz submission
     */
    private function grade_quiz(array $quiz_config, array $response): array {
        $questions = $quiz_config['questions'] ?? [];
        $answers = $response['answers'] ?? [];
        $passing_score = $quiz_config['passing_score'] ?? 70;

        $correct = 0;
        $total = count($questions);

        foreach ($questions as $i => $q) {
            if (isset($answers[$i]) && (int)$answers[$i] === (int)$q['correct']) {
                $correct++;
            }
        }

        $score = $total > 0 ? round(($correct / $total) * 100) : 0;

        return [
            'score' => $score,
            'correct' => $correct,
            'total' => $total,
            'passed' => $score >= $passing_score,
        ];
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-scribe-portal.php
git commit -m "feat(scribe): add complete_step method with quiz grading"
```

---

## Phase 3: Transmission Session Class

### Task 3.1: Create TransmissionSession Class

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php`

**Step 1: Create the class file**

```php
<?php
/**
 * World of Rectification - Transmission Session
 *
 * Handles Scribe-Sprout chat sessions and queue management.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_TransmissionSession {

    private $table_transmissions;
    private $table_messages;
    private $table_scribes;
    private $table_sprouts;

    public function __construct() {
        global $wpdb;
        $this->table_transmissions = $wpdb->prefix . 'wor_transmissions';
        $this->table_messages = $wpdb->prefix . 'wor_transmission_messages';
        $this->table_scribes = $wpdb->prefix . 'wor_scribes';
        $this->table_sprouts = $wpdb->prefix . 'wor_sprouts';
    }

    /**
     * Get the sprout waiting queue
     */
    public function get_queue(): array {
        return get_option('wor_sprout_queue', []);
    }

    /**
     * Ensure a sprout record exists for a user
     */
    public function ensure_sprout(int $user_id): int {
        global $wpdb;

        $existing = $wpdb->get_var($wpdb->prepare(
            "SELECT id FROM {$this->table_sprouts} WHERE user_id = %d",
            $user_id
        ));

        if ($existing) {
            return (int)$existing;
        }

        $wpdb->insert($this->table_sprouts, ['user_id' => $user_id]);
        return $wpdb->insert_id;
    }
}
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): create TransmissionSession class skeleton"
```

---

### Task 3.2: Add Help Request Method

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php`

**Step 1: Add request_help method**

Add to `WoR_TransmissionSession` class after `ensure_sprout`:

```php
    /**
     * Sprout requests help - enters queue
     */
    public function request_help(int $sprout_user_id, ?int $quest_id = null, string $topic = ''): array {
        global $wpdb;

        // Check if already in active session
        $sprout_id = $this->ensure_sprout($sprout_user_id);

        $existing = $wpdb->get_var($wpdb->prepare(
            "SELECT id FROM {$this->table_transmissions}
             WHERE sprout_id = %d AND status = 'active'",
            $sprout_id
        ));

        if ($existing) {
            return ['error' => 'Already in active session', 'transmission_id' => (int)$existing];
        }

        // Add to waiting queue
        $queue = $this->get_queue();
        $queue[] = [
            'sprout_id' => $sprout_id,
            'user_id' => $sprout_user_id,
            'quest_id' => $quest_id,
            'topic' => $topic,
            'requested_at' => time(),
        ];
        update_option('wor_sprout_queue', $queue);

        // Broadcast to available scribes
        $this->broadcast_help_request($sprout_id, $quest_id, $topic);

        return [
            'success' => true,
            'queue_position' => count($queue),
            'sprout_id' => $sprout_id,
        ];
    }

    /**
     * Broadcast help request via Visual Bridge
     */
    private function broadcast_help_request(int $sprout_id, ?int $quest_id, string $topic): void {
        $payload = [
            'event' => 'SPROUT_HELP_REQUEST',
            'sprout_id' => $sprout_id,
            'quest_id' => $quest_id,
            'topic' => $topic,
            'timestamp' => time(),
        ];

        wp_remote_post('http://localhost:8768/broadcast', [
            'body' => json_encode($payload),
            'headers' => ['Content-Type' => 'application/json'],
            'timeout' => 2,
            'blocking' => false,
        ]);
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): add request_help method with queue and broadcast"
```

---

### Task 3.3: Add Accept Sprout Method

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php`

**Step 1: Add accept_sprout method**

Add after `broadcast_help_request`:

```php
    /**
     * Scribe accepts a waiting Sprout
     */
    public function accept_sprout(int $scribe_user_id, int $sprout_id): array {
        global $wpdb;

        // Verify scribe is eligible
        $scribe = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE user_id = %d",
            $scribe_user_id
        ), ARRAY_A);

        if (!$scribe) {
            return ['error' => 'Not registered as Scribe'];
        }

        if (!$scribe['onboarding_completed']) {
            return ['error' => 'Onboarding not completed'];
        }

        // Remove from queue
        $queue = $this->get_queue();
        $sprout_data = null;
        foreach ($queue as $i => $item) {
            if ($item['sprout_id'] === $sprout_id) {
                $sprout_data = $item;
                unset($queue[$i]);
                break;
            }
        }
        update_option('wor_sprout_queue', array_values($queue));

        if (!$sprout_data) {
            return ['error' => 'Sprout no longer waiting'];
        }

        // Create transmission session
        $wpdb->insert($this->table_transmissions, [
            'scribe_id' => $scribe['id'],
            'sprout_id' => $sprout_id,
            'quest_context_id' => $sprout_data['quest_id'] ?? null,
            'status' => 'active',
            'started_at' => current_time('mysql'),
        ]);

        $transmission_id = $wpdb->insert_id;

        // Assign scribe to sprout
        $wpdb->update(
            $this->table_sprouts,
            ['assigned_scribe_id' => $scribe['id']],
            ['id' => $sprout_id]
        );

        // System message to start
        $this->send_message_internal(
            $transmission_id,
            'system',
            0,
            "Transmission started. {$scribe['cohort']} Scribe is here to help."
        );

        return [
            'success' => true,
            'transmission_id' => $transmission_id,
            'sprout_topic' => $sprout_data['topic'] ?? '',
        ];
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): add accept_sprout method with session creation"
```

---

### Task 3.4: Add Message Send/Poll Methods

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php`

**Step 1: Add send_message and poll_messages methods**

Add after `accept_sprout`:

```php
    /**
     * Send a message in a transmission
     */
    public function send_message(int $transmission_id, string $sender_type, int $sender_user_id, string $message): array {
        global $wpdb;

        // Verify session is active
        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d AND status = 'active'",
            $transmission_id
        ));

        if (!$session) {
            return ['error' => 'Session not active'];
        }

        // Sanitize message
        $message = sanitize_textarea_field($message);
        if (empty(trim($message))) {
            return ['error' => 'Message cannot be empty'];
        }

        return $this->send_message_internal($transmission_id, $sender_type, $sender_user_id, $message);
    }

    /**
     * Internal message insertion (no validation)
     */
    private function send_message_internal(int $transmission_id, string $sender_type, int $sender_user_id, string $message): array {
        global $wpdb;

        $wpdb->insert($this->table_messages, [
            'transmission_id' => $transmission_id,
            'sender_type' => $sender_type,
            'sender_id' => $sender_user_id,
            'message_text' => $message,
            'created_at' => current_time('mysql'),
        ]);

        $message_id = $wpdb->insert_id;

        // Schedule async intent classification for scribe messages
        if ($sender_type === 'scribe') {
            wp_schedule_single_event(time() + 5, 'wor_classify_message_intent', [$message_id]);
        }

        return [
            'success' => true,
            'message_id' => $message_id,
            'timestamp' => current_time('mysql'),
        ];
    }

    /**
     * Poll for new messages
     */
    public function poll_messages(int $transmission_id, int $last_message_id = 0): array {
        global $wpdb;

        // Verify transmission exists
        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d",
            $transmission_id
        ));

        if (!$session) {
            return ['error' => 'Transmission not found'];
        }

        $messages = $wpdb->get_results($wpdb->prepare(
            "SELECT id, sender_type, sender_id, message_text, created_at
             FROM {$this->table_messages}
             WHERE transmission_id = %d AND id > %d
             ORDER BY id ASC",
            $transmission_id, $last_message_id
        ), ARRAY_A);

        $last_id = $last_message_id;
        if (!empty($messages)) {
            $last_id = (int)end($messages)['id'];
        }

        return [
            'success' => true,
            'messages' => $messages,
            'last_id' => $last_id,
            'session_status' => $session->status,
        ];
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): add send_message and poll_messages methods"
```

---

### Task 3.5: Add End Transmission Method

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php`

**Step 1: Add end_transmission method**

Add after `poll_messages`:

```php
    /**
     * End a transmission session
     */
    public function end_transmission(int $transmission_id, int $ended_by_user_id, ?int $rating = null, ?string $feedback = null): array {
        global $wpdb;

        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d",
            $transmission_id
        ), ARRAY_A);

        if (!$session) {
            return ['error' => 'Transmission not found'];
        }

        if ($session['status'] !== 'active') {
            return ['error' => 'Session already ended'];
        }

        // Calculate duration
        $started = strtotime($session['started_at']);
        $duration = time() - $started;

        // Update session
        $wpdb->update(
            $this->table_transmissions,
            [
                'status' => 'completed',
                'ended_at' => current_time('mysql'),
                'duration_seconds' => $duration,
                'scribe_rating' => $rating,
                'sprout_feedback' => $feedback,
            ],
            ['id' => $transmission_id]
        );

        // Update Scribe stats
        $wpdb->query($wpdb->prepare(
            "UPDATE {$this->table_scribes}
             SET mentorship_count = mentorship_count + 1
             WHERE id = %d",
            $session['scribe_id']
        ));

        // Update Sprout stats
        $wpdb->query($wpdb->prepare(
            "UPDATE {$this->table_sprouts}
             SET total_sessions = total_sessions + 1,
                 assigned_scribe_id = NULL
             WHERE id = %d",
            $session['sprout_id']
        ));

        // Queue for training export
        wp_schedule_single_event(time() + 60, 'wor_queue_transmission_for_training', [$transmission_id]);

        return [
            'success' => true,
            'duration_seconds' => $duration,
        ];
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): add end_transmission method with stats update"
```

---

## Phase 4: Mentor Data Pipeline Class

### Task 4.1: Create MentorDataPipeline Class

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php`

**Step 1: Create the class with intent classification**

```php
<?php
/**
 * World of Rectification - Mentor Data Pipeline
 *
 * Handles intent classification and AI training data export.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WoR_MentorDataPipeline {

    private $intent_patterns = [
        'explanation' => [
            'patterns' => [
                '/let me explain/',
                '/here\'s how/',
                '/the reason is/',
                '/basically,/',
                '/in other words/',
                '/think of it like/',
                '/this means/',
                '/simply put/',
            ],
            'weight' => 1.0,
        ],
        'hint' => [
            'patterns' => [
                '/have you tried/',
                '/what if you/',
                '/consider looking at/',
                '/hint:/',
                '/try checking/',
                '/maybe look at/',
                '/you might want to/',
                '/suggest/',
            ],
            'weight' => 0.9,
        ],
        'encouragement' => [
            'patterns' => [
                '/good job/',
                '/great/',
                '/well done/',
                '/keep going/',
                '/don\'t give up/',
                '/you\'ve got this/',
                '/excellent/',
                '/nice work/',
            ],
            'weight' => 0.8,
        ],
        'clarification' => [
            'patterns' => [
                '/do you mean/',
                '/are you asking/',
                '/can you clarify/',
                '/what do you mean/',
                '/could you explain/',
                '/are you referring to/',
            ],
            'weight' => 0.7,
        ],
        'redirect' => [
            'patterns' => [
                '/let\'s focus on/',
                '/first,/',
                '/before that/',
                '/step back/',
                '/start with/',
                '/let\'s begin/',
            ],
            'weight' => 0.7,
        ],
    ];

    /**
     * Classify a message's intent
     */
    public function classify_intent(string $message): array {
        $message_lower = strtolower($message);
        $scores = [];

        foreach ($this->intent_patterns as $intent => $config) {
            $score = 0;
            foreach ($config['patterns'] as $pattern) {
                if (preg_match($pattern . 'i', $message)) {
                    $score += $config['weight'];
                }
            }
            if ($score > 0) {
                $scores[$intent] = $score;
            }
        }

        arsort($scores);

        $primary_intent = !empty($scores) ? array_key_first($scores) : 'general';
        $confidence = !empty($scores) ? round($scores[$primary_intent], 2) : 0;

        return [
            'intent' => $primary_intent,
            'confidence' => $confidence,
            'all_scores' => $scores,
        ];
    }
}
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php
git commit -m "feat(scribe): create MentorDataPipeline class with intent classification"
```

---

### Task 4.2: Add Message Processing Methods

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php`

**Step 1: Add process_message_intent and helper methods**

Add after `classify_intent`:

```php
    /**
     * Process a message for intent classification (scheduled task)
     */
    public function process_message_intent(int $message_id): void {
        global $wpdb;

        $message = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$wpdb->prefix}wor_transmission_messages WHERE id = %d",
            $message_id
        ), ARRAY_A);

        if (!$message || $message['sender_type'] !== 'scribe') {
            return;
        }

        $classification = $this->classify_intent($message['message_text']);

        // Update message with intent
        $wpdb->update(
            $wpdb->prefix . 'wor_transmission_messages',
            ['intent_label' => $classification['intent']],
            ['id' => $message_id]
        );

        // Update intent cluster
        $this->update_cluster($classification['intent'], $message['message_text']);
    }

    /**
     * Update intent cluster with new sample
     */
    private function update_cluster(string $intent, string $message): void {
        global $wpdb;

        $table = $wpdb->prefix . 'wor_intent_clusters';
        $phrase = $this->extract_phrase($message);

        $cluster = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM $table WHERE intent_name = %s",
            $intent
        ), ARRAY_A);

        if (!$cluster) {
            $wpdb->insert($table, [
                'intent_name' => $intent,
                'sample_phrases' => json_encode([$phrase]),
                'message_count' => 1,
            ]);
        } else {
            $phrases = json_decode($cluster['sample_phrases'], true) ?: [];
            $phrases[] = $phrase;
            $phrases = array_slice($phrases, -20);

            $wpdb->update(
                $table,
                [
                    'sample_phrases' => json_encode($phrases),
                    'message_count' => $cluster['message_count'] + 1,
                ],
                ['id' => $cluster['id']]
            );
        }
    }

    /**
     * Extract key phrase from message
     */
    private function extract_phrase(string $message): string {
        $sentence = preg_split('/[.!?]/', $message)[0] ?? $message;
        return trim(substr($sentence, 0, 100));
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php
git commit -m "feat(scribe): add message processing and cluster update methods"
```

---

### Task 4.3: Add Training Export Methods

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php`

**Step 1: Add export methods**

Add after `extract_phrase`:

```php
    /**
     * Export a single transmission for training
     */
    public function export_transmission(int $transmission_id): array {
        global $wpdb;

        $transmission = $wpdb->get_row($wpdb->prepare(
            "SELECT t.*, s.user_id as scribe_user_id, sp.user_id as sprout_user_id
             FROM {$wpdb->prefix}wor_transmissions t
             JOIN {$wpdb->prefix}wor_scribes s ON t.scribe_id = s.id
             JOIN {$wpdb->prefix}wor_sprouts sp ON t.sprout_id = sp.id
             WHERE t.id = %d",
            $transmission_id
        ), ARRAY_A);

        if (!$transmission) {
            return ['error' => 'Transmission not found'];
        }

        $messages = $wpdb->get_results($wpdb->prepare(
            "SELECT sender_type, sender_id, message_text, intent_label, created_at
             FROM {$wpdb->prefix}wor_transmission_messages
             WHERE transmission_id = %d
             ORDER BY id ASC",
            $transmission_id
        ), ARRAY_A);

        $training_example = [
            'metadata' => [
                'transmission_id' => $transmission_id,
                'duration_seconds' => (int)$transmission['duration_seconds'],
                'scribe_rating' => (int)$transmission['scribe_rating'],
                'quest_context' => (int)$transmission['quest_context_id'],
            ],
            'messages' => [],
        ];

        foreach ($messages as $msg) {
            $training_example['messages'][] = [
                'role' => $msg['sender_type'] === 'scribe' ? 'assistant' : 'user',
                'content' => $msg['message_text'],
                'intent' => $msg['intent_label'],
                'timestamp' => $msg['created_at'],
            ];
        }

        return $training_example;
    }

    /**
     * Get training pipeline statistics
     */
    public function get_training_stats(): array {
        global $wpdb;

        $total_transmissions = (int)$wpdb->get_var(
            "SELECT COUNT(*) FROM {$wpdb->prefix}wor_transmissions WHERE status = 'completed'"
        );

        $total_messages = (int)$wpdb->get_var(
            "SELECT COUNT(*) FROM {$wpdb->prefix}wor_transmission_messages WHERE sender_type = 'scribe'"
        );

        $intent_distribution = $wpdb->get_results(
            "SELECT intent_label, COUNT(*) as count
             FROM {$wpdb->prefix}wor_transmission_messages
             WHERE sender_type = 'scribe' AND intent_label IS NOT NULL
             GROUP BY intent_label
             ORDER BY count DESC",
            ARRAY_A
        );

        $avg_rating = $wpdb->get_var(
            "SELECT AVG(scribe_rating) FROM {$wpdb->prefix}wor_transmissions WHERE scribe_rating IS NOT NULL"
        );

        return [
            'total_transmissions' => $total_transmissions,
            'total_scribe_messages' => $total_messages,
            'intent_distribution' => $intent_distribution,
            'average_rating' => $avg_rating ? round((float)$avg_rating, 2) : null,
            'training_eligible' => ($total_transmissions >= 50 && ($avg_rating ?? 0) >= 3.5),
        ];
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-mentor-data-pipeline.php
git commit -m "feat(scribe): add export_transmission and get_training_stats methods"
```

---

## Phase 5: REST API Endpoints

### Task 5.1: Register Scribe API Endpoints

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php`

**Step 1: Add endpoint registration in register_routes**

Add inside the `register_routes()` method:

```php
        // Scribe Portal endpoints
        register_rest_route('wor/v1', '/scribe/register', [
            'methods' => 'POST',
            'callback' => [$this, 'api_scribe_register'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/scribe/onboarding', [
            'methods' => 'GET',
            'callback' => [$this, 'api_scribe_onboarding'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/scribe/complete-step', [
            'methods' => 'POST',
            'callback' => [$this, 'api_scribe_complete_step'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        // Transmission endpoints
        register_rest_route('wor/v1', '/transmission/request', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_request'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/queue', [
            'methods' => 'GET',
            'callback' => [$this, 'api_transmission_queue'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/accept', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_accept'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/messages', [
            'methods' => 'GET',
            'callback' => [$this, 'api_transmission_poll'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/send', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_send'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/end', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_end'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        // Training pipeline endpoints
        register_rest_route('wor/v1', '/training/stats', [
            'methods' => 'GET',
            'callback' => [$this, 'api_training_stats'],
            'permission_callback' => function() { return current_user_can('manage_options'); },
        ]);
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php
git commit -m "feat(scribe): register REST API endpoints for scribe portal"
```

---

### Task 5.2: Add Scribe Portal API Callbacks

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php`

**Step 1: Add API callback methods**

Add at the end of the `WoR_GameEngine` class:

```php
    /**
     * API: Register as Scribe
     */
    public function api_scribe_register(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $cohort = sanitize_text_field($request->get_param('cohort'));
        $expertise = $request->get_param('expertise') ?? [];

        if (!in_array($cohort, ['internal', 'community', 'domain_expert'])) {
            return rest_ensure_response(['error' => 'Invalid cohort']);
        }

        $portal = new WoR_ScribePortal();
        $result = $portal->register_scribe($user_id, $cohort, $expertise);

        if ($result === false) {
            return rest_ensure_response(['error' => 'Already registered']);
        }

        return rest_ensure_response(['success' => true, 'scribe_id' => $result]);
    }

    /**
     * API: Get onboarding status
     */
    public function api_scribe_onboarding(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $portal = new WoR_ScribePortal();
        $scribe = $portal->get_scribe_by_user($user_id);

        if (!$scribe) {
            return rest_ensure_response(['error' => 'Not registered as Scribe']);
        }

        $flow = $portal->get_onboarding_flow($scribe['cohort']);
        $current_step = (int)$scribe['onboarding_step'];

        return rest_ensure_response([
            'cohort' => $scribe['cohort'],
            'current_step' => $current_step,
            'total_steps' => count($flow),
            'completed' => (bool)$scribe['onboarding_completed'],
            'current_content' => $flow[$current_step] ?? null,
            'progress_percent' => count($flow) > 0 ? round(($current_step / count($flow)) * 100) : 0,
        ]);
    }

    /**
     * API: Complete onboarding step
     */
    public function api_scribe_complete_step(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $step = (int)$request->get_param('step');
        $response = $request->get_param('response') ?? [];

        $portal = new WoR_ScribePortal();
        $scribe = $portal->get_scribe_by_user($user_id);

        if (!$scribe) {
            return rest_ensure_response(['error' => 'Not registered as Scribe']);
        }

        $result = $portal->complete_step($scribe['id'], $step, $response);
        return rest_ensure_response($result);
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php
git commit -m "feat(scribe): add scribe portal API callbacks"
```

---

### Task 5.3: Add Transmission API Callbacks

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-game-engine.php`

**Step 1: Add transmission API methods**

Add after the scribe API methods:

```php
    /**
     * API: Request help (Sprout)
     */
    public function api_transmission_request(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $quest_id = $request->get_param('quest_id') ? (int)$request->get_param('quest_id') : null;
        $topic = sanitize_text_field($request->get_param('topic') ?? '');

        $session = new WoR_TransmissionSession();
        $result = $session->request_help($user_id, $quest_id, $topic);

        return rest_ensure_response($result);
    }

    /**
     * API: Get sprout queue (Scribe)
     */
    public function api_transmission_queue(WP_REST_Request $request): WP_REST_Response {
        $session = new WoR_TransmissionSession();
        return rest_ensure_response(['queue' => $session->get_queue()]);
    }

    /**
     * API: Accept sprout (Scribe)
     */
    public function api_transmission_accept(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $sprout_id = (int)$request->get_param('sprout_id');

        $session = new WoR_TransmissionSession();
        $result = $session->accept_sprout($user_id, $sprout_id);

        return rest_ensure_response($result);
    }

    /**
     * API: Poll messages
     */
    public function api_transmission_poll(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $last_id = (int)$request->get_param('last') ?? 0;

        $session = new WoR_TransmissionSession();
        $result = $session->poll_messages($transmission_id, $last_id);

        return rest_ensure_response($result);
    }

    /**
     * API: Send message
     */
    public function api_transmission_send(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $user_id = get_current_user_id();
        $message = $request->get_param('message');
        $sender_type = sanitize_text_field($request->get_param('sender_type'));

        $session = new WoR_TransmissionSession();
        $result = $session->send_message($transmission_id, $sender_type, $user_id, $message);

        return rest_ensure_response($result);
    }

    /**
     * API: End transmission
     */
    public function api_transmission_end(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $user_id = get_current_user_id();
        $rating = $request->get_param('rating') ? (int)$request->get_param('rating') : null;
        $feedback = sanitize_textarea_field($request->get_param('feedback') ?? '');

        $session = new WoR_TransmissionSession();
        $result = $session->end_transmission($transmission_id, $user_id, $rating, $feedback ?: null);

        return rest_ensure_response($result);
    }

    /**
     * API: Get training stats
     */
    public function api_training_stats(WP_REST_Request $request): WP_REST_Response {
        $pipeline = new WoR_MentorDataPipeline();
        return rest_ensure_response($pipeline->get_training_stats());
    }
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/includes/class-transmission-session.php
git commit -m "feat(scribe): add transmission and training API callbacks"
```

---

## Phase 6: Scheduled Tasks

### Task 6.1: Register Cron Handlers

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/world-of-rectification.php`

**Step 1: Add cron handlers and activation hooks**

Add after the existing `wor_init()` function:

```php
/**
 * Scheduled task: Classify message intent
 */
add_action('wor_classify_message_intent', function($message_id) {
    require_once WOR_PLUGIN_DIR . 'includes/class-mentor-data-pipeline.php';
    $pipeline = new WoR_MentorDataPipeline();
    $pipeline->process_message_intent($message_id);
});

/**
 * Scheduled task: Queue transmission for training
 */
add_action('wor_queue_transmission_for_training', function($transmission_id) {
    require_once WOR_PLUGIN_DIR . 'includes/class-mentor-data-pipeline.php';
    $pipeline = new WoR_MentorDataPipeline();
    $pipeline->export_transmission($transmission_id);
});

/**
 * Scheduled task: Cleanup stale sessions
 */
add_action('wor_cleanup_stale_sessions', function() {
    global $wpdb;

    // Mark abandoned sessions
    $wpdb->query(
        "UPDATE {$wpdb->prefix}wor_transmissions
         SET status = 'abandoned', ended_at = NOW()
         WHERE status = 'active'
         AND started_at < DATE_SUB(NOW(), INTERVAL 30 MINUTE)"
    );

    // Clear stale queue entries
    $queue = get_option('wor_sprout_queue', []);
    $queue = array_filter($queue, function($item) {
        return $item['requested_at'] > time() - 3600;
    });
    update_option('wor_sprout_queue', array_values($queue));
});
```

**Step 2: Update activation hook to schedule cron**

Modify the `wor_activate()` function:

```php
function wor_activate() {
    require_once WOR_PLUGIN_DIR . 'includes/class-game-engine.php';
    $engine = new WoR_GameEngine();
    $engine->create_tables();

    // Schedule cleanup cron
    if (!wp_next_scheduled('wor_cleanup_stale_sessions')) {
        wp_schedule_event(time(), 'hourly', 'wor_cleanup_stale_sessions');
    }
}
```

**Step 3: Add deactivation hook**

Add after `register_activation_hook`:

```php
register_deactivation_hook(__FILE__, function() {
    wp_clear_scheduled_hook('wor_cleanup_stale_sessions');
});
```

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/world-of-rectification.php
git commit -m "feat(scribe): add cron handlers for intent classification and cleanup"
```

---

## Phase 7: Include New Classes

### Task 7.1: Update Main Plugin File

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/world-of-rectification.php`

**Step 1: Add require statements**

Add after the existing `require_once` statements:

```php
// Include Scribe Protocol classes
require_once WOR_PLUGIN_DIR . 'includes/class-scribe-portal.php';
require_once WOR_PLUGIN_DIR . 'includes/class-transmission-session.php';
require_once WOR_PLUGIN_DIR . 'includes/class-mentor-data-pipeline.php';
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/world-of-rectification.php
git commit -m "feat(scribe): include new Scribe Protocol classes in main plugin"
```

---

## Summary

| Phase | Tasks | Files Created/Modified |
|-------|-------|------------------------|
| 1. Database | 1 | `class-game-engine.php` |
| 2. Scribe Portal | 3 | `class-scribe-portal.php` |
| 3. Transmission | 5 | `class-transmission-session.php` |
| 4. Data Pipeline | 3 | `class-mentor-data-pipeline.php` |
| 5. REST API | 3 | `class-game-engine.php` |
| 6. Scheduled Tasks | 1 | `world-of-rectification.php` |
| 7. Integration | 1 | `world-of-rectification.php` |

**Total: 17 tasks**

---

## Testing Checklist

After implementation, verify:

- [ ] Scribe registration creates record with correct cohort
- [ ] Onboarding flow progresses through steps
- [ ] Quiz validation works (pass/fail)
- [ ] Sprout request enters queue
- [ ] Scribe can accept from queue
- [ ] Messages send and poll correctly
- [ ] Intent classification runs on scribe messages
- [ ] Session end updates stats
- [ ] Training stats endpoint returns data
- [ ] Cron cleanup runs hourly
