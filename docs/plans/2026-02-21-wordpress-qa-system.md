# WordPress Q&A System Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a collaborative Q&A section to the WordPress site where both humans and AI can ask and answer questions about the Geometry OS project.

**Architecture:** Custom WordPress plugin creates a `question` post type with status workflow (pending → answered → verified) and threaded comments. A Python `QaProcessor` module integrates with the existing Evolution Daemon to periodically scan for pending questions and generate AI responses via ZAI Bridge.

**Tech Stack:** WordPress PHP (custom post types, taxonomies), Python (WordPress REST API, ZAI Bridge), MySQL

---

## Task 1: WordPress Plugin Scaffold

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/geometry-qa.php`

**Step 1: Create plugin directory and main file**

```bash
mkdir -p wordpress_zone/wordpress/wp-content/plugins/geometry-qa
```

**Step 2: Write plugin header and initialization**

```php
<?php
/**
 * Plugin Name: Geometry OS Q&A
 * Description: Collaborative Q&A system for Geometry OS project
 * Version: 1.0.0
 * Author: Geometry OS AI
 */

defined('ABSPATH') || exit;

define('GEOMETRY_QA_VERSION', '1.0.0');
define('GEOMETRY_QA_PATH', plugin_dir_path(__FILE__));

// Load components
require_once GEOMETRY_QA_PATH . 'includes/post-type.php';
require_once GEOMETRY_QA_PATH . 'includes/status-field.php';
require_once GEOMETRY_QA_PATH . 'includes/rest-api.php';
require_once GEOMETRY_QA_PATH . 'includes/shortcodes.php';
```

**Step 3: Verify plugin file created**

Run: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-qa/`
Expected: `geometry-qa.php` exists

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/geometry-qa.php
git commit -m "feat(wp-qa): add plugin scaffold"
```

---

## Task 2: Question Custom Post Type

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/post-type.php`

**Step 1: Write the post type registration**

```php
<?php
/**
 * Question Custom Post Type
 */

defined('ABSPATH') || exit;

function geometry_qa_register_post_type() {
    $labels = [
        'name'               => 'Questions',
        'singular_name'      => 'Question',
        'add_new'            => 'Ask Question',
        'add_new_item'       => 'Ask New Question',
        'edit_item'          => 'Edit Question',
        'view_item'          => 'View Question',
        'search_items'       => 'Search Questions',
        'not_found'          => 'No questions found',
        'menu_name'          => 'Q&A',
    ];

    $args = [
        'labels'              => $labels,
        'public'              => true,
        'publicly_queryable'  => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'query_var'           => true,
        'rewrite'             => ['slug' => 'questions'],
        'capability_type'     => 'post',
        'has_archive'         => true,
        'hierarchical'        => false,
        'menu_position'       => 25,
        'menu_icon'           => 'dashicons-format-chat',
        'supports'            => ['title', 'editor', 'author', 'comments', 'custom-fields'],
        'show_in_rest'        => true,
    ];

    register_post_type('geometry_question', $args);
}
add_action('init', 'geometry_qa_register_post_type');

/**
 * Register question categories taxonomy
 */
function geometry_qa_register_taxonomy() {
    $labels = [
        'name'          => 'Question Categories',
        'singular_name' => 'Category',
        'search_items'  => 'Search Categories',
        'all_items'     => 'All Categories',
        'edit_item'     => 'Edit Category',
        'add_new_item'  => 'Add New Category',
        'menu_name'     => 'Categories',
    ];

    $args = [
        'hierarchical'      => true,
        'labels'            => $labels,
        'show_ui'           => true,
        'show_admin_column' => true,
        'query_var'         => true,
        'rewrite'           => ['slug' => 'question-category'],
        'show_in_rest'      => true,
    ];

    register_taxonomy('question_category', ['geometry_question'], $args);
}
add_action('init', 'geometry_qa_register_taxonomy');

/**
 * Create default categories on plugin activation
 */
function geometry_qa_create_default_categories() {
    $categories = [
        'Architecture'     => 'System design and structure questions',
        'Evolution'        => 'Questions about self-improvement daemon',
        'How-To'           => 'Usage and tutorial questions',
        'Bugs'             => 'Bug reports and issues',
        'Feature Requests' => 'Ideas for new features',
    ];

    foreach ($categories as $name => $description) {
        if (!term_exists($name, 'question_category')) {
            wp_insert_term($name, 'question_category', [
                'description' => $description,
                'slug'        => sanitize_title($name),
            ]);
        }
    }
}
register_activation_hook(GEOMETRY_QA_PATH . 'geometry-qa.php', 'geometry_qa_create_default_categories');
```

**Step 2: Verify file created**

Run: `cat wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/post-type.php | head -20`
Expected: Shows PHP code with `register_post_type`

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/post-type.php
git commit -m "feat(wp-qa): add question custom post type and taxonomy"
```

---

## Task 3: Question Status Field

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/status-field.php`

**Step 1: Write status field implementation**

```php
<?php
/**
 * Question Status Field
 *
 * Status workflow: pending -> answered -> verified
 */

defined('ABSPATH') || exit;

/**
 * Add status meta box to question edit screen
 */
function geometry_qa_add_status_meta_box() {
    add_meta_box(
        'geometry_qa_status',
        'Question Status',
        'geometry_qa_status_meta_box_callback',
        'geometry_question',
        'side',
        'high'
    );
}
add_action('add_meta_boxes', 'geometry_qa_add_status_meta_box');

/**
 * Meta box callback
 */
function geometry_qa_status_meta_box_callback($post) {
    wp_nonce_field('geometry_qa_status', 'geometry_qa_status_nonce');

    $status = get_post_meta($post->ID, '_qa_status', true) ?: 'pending';
    $answered_by = get_post_meta($post->ID, '_qa_answered_by', true);
    $ai_response = get_post_meta($post->ID, '_qa_has_ai_response', true);

    $statuses = [
        'pending'   => 'Pending - Awaiting Answer',
        'answered'  => 'Answered - Response Provided',
        'verified'  => 'Verified - Solution Confirmed',
    ];
    ?>
    <p>
        <label for="qa_status"><strong>Status:</strong></label><br>
        <select name="qa_status" id="qa_status">
            <?php foreach ($statuses as $value => $label): ?>
                <option value="<?php echo esc_attr($value); ?>" <?php selected($status, $value); ?>>
                    <?php echo esc_html($label); ?>
                </option>
            <?php endforeach; ?>
        </select>
    </p>
    <?php if ($ai_response): ?>
        <p><em>AI has responded to this question.</em></p>
    <?php endif; ?>
    <?php if ($answered_by): ?>
        <p><small>Answered by: <?php echo esc_html($answered_by); ?></small></p>
    <?php endif; ?>
    <?php
}

/**
 * Save status meta
 */
function geometry_qa_save_status_meta($post_id) {
    if (!isset($_POST['geometry_qa_status_nonce']) ||
        !wp_verify_nonce($_POST['geometry_qa_status_nonce'], 'geometry_qa_status')) {
        return;
    }

    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
        return;
    }

    if (!current_user_can('edit_post', $post_id)) {
        return;
    }

    if (isset($_POST['qa_status'])) {
        $allowed = ['pending', 'answered', 'verified'];
        $status = sanitize_text_field($_POST['qa_status']);

        if (in_array($status, $allowed)) {
            update_post_meta($post_id, '_qa_status', $status);
        }
    }
}
add_action('save_post_geometry_question', 'geometry_qa_save_status_meta');

/**
 * Add status column to admin list
 */
function geometry_qa_status_column($columns) {
    $new = [];
    foreach ($columns as $key => $value) {
        $new[$key] = $value;
        if ($key === 'title') {
            $new['qa_status'] = 'Status';
        }
    }
    return $new;
}
add_filter('manage_geometry_question_posts_columns', 'geometry_qa_status_column');

/**
 * Render status column
 */
function geometry_qa_status_column_content($column, $post_id) {
    if ($column === 'qa_status') {
        $status = get_post_meta($post_id, '_qa_status', true) ?: 'pending';
        $colors = [
            'pending'  => '#f0ad4e',
            'answered' => '#5bc0de',
            'verified' => '#5cb85c',
        ];
        $labels = [
            'pending'  => 'Pending',
            'answered' => 'Answered',
            'verified' => 'Verified',
        ];
        printf(
            '<span style="background:%s;color:white;padding:2px 8px;border-radius:3px;">%s</span>',
            esc_attr($colors[$status]),
            esc_html($labels[$status])
        );
    }
}
add_action('manage_geometry_question_posts_custom_column', 'geometry_qa_status_column_content', 10, 2);
```

**Step 2: Verify file created**

Run: `ls wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/status-field.php`
Expected: File exists

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/status-field.php
git commit -m "feat(wp-qa): add question status field with workflow"
```

---

## Task 4: REST API Endpoints

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/rest-api.php`

**Step 1: Write REST API endpoints**

```php
<?php
/**
 * REST API Endpoints for Q&A
 */

defined('ABSPATH') || exit;

/**
 * Register REST routes
 */
function geometry_qa_register_rest_routes() {
    // GET pending questions (for AI processor)
    register_rest_route('geometry-qa/v1', '/pending', [
        'methods'  => 'GET',
        'callback' => 'geometry_qa_get_pending_questions',
        'permission_callback' => 'geometry_qa_api_permission_check',
    ]);

    // POST answer to question (for AI processor)
    register_rest_route('geometry-qa/v1', '/answer/(?P<id>\d+)', [
        'methods'  => 'POST',
        'callback' => 'geometry_qa_submit_answer',
        'permission_callback' => 'geometry_qa_api_permission_check',
        'args'     => [
            'id' => ['validate_callback' => 'is_numeric'],
        ],
    ]);

    // POST new question (for AI to ask questions)
    register_rest_route('geometry-qa/v1', '/ask', [
        'methods'  => 'POST',
        'callback' => 'geometry_qa_create_question',
        'permission_callback' => 'geometry_qa_api_permission_check',
    ]);
}
add_action('rest_api_init', 'geometry_qa_register_rest_routes');

/**
 * API permission check via Bearer token
 */
function geometry_qa_api_permission_check($request) {
    $auth_header = $request->get_header('Authorization');
    if (!$auth_header || !preg_match('/Bearer\s+(.+)/', $auth_header, $matches)) {
        return new WP_Error('missing_auth', 'Missing authorization header', ['status' => 401]);
    }

    $token = $matches[1];
    $expected = defined('GEOMETRY_QA_API_TOKEN') ? GEOMETRY_QA_API_TOKEN : getenv('GEOMETRY_QA_API_TOKEN');

    if (!$expected || !hash_equals($expected, $token)) {
        return new WP_Error('invalid_auth', 'Invalid API token', ['status' => 403]);
    }

    return true;
}

/**
 * Get pending questions
 */
function geometry_qa_get_pending_questions($request) {
    $category = $request->get_param('category');
    $limit = intval($request->get_param('limit')) ?: 10;

    $args = [
        'post_type'      => 'geometry_question',
        'posts_per_page' => $limit,
        'meta_query'     => [
            [
                'key'     => '_qa_status',
                'value'   => 'pending',
                'compare' => '=',
            ],
        ],
    ];

    if ($category) {
        $args['tax_query'] = [
            [
                'taxonomy' => 'question_category',
                'field'    => 'slug',
                'terms'    => sanitize_title($category),
            ],
        ];
    }

    $query = new WP_Query($args);
    $questions = [];

    foreach ($query->posts as $post) {
        $terms = wp_get_post_terms($post->ID, 'question_category');
        $categories = array_map(fn($t) => $t->name, $terms);

        $questions[] = [
            'id'         => $post->ID,
            'title'      => $post->post_title,
            'content'    => $post->post_content,
            'author'     => get_the_author_meta('display_name', $post->post_author),
            'categories' => $categories,
            'created'    => $post->post_date,
            'url'        => get_permalink($post->ID),
        ];
    }

    return rest_ensure_response([
        'count' => count($questions),
        'questions' => $questions,
    ]);
}

/**
 * Submit AI answer
 */
function geometry_qa_submit_answer($request) {
    $post_id = intval($request['id']);
    $answer = $request->get_json_params()['answer'] ?? '';

    if (empty($answer)) {
        return new WP_Error('missing_answer', 'Answer content required', ['status' => 400]);
    }

    // Verify question exists
    $question = get_post($post_id);
    if (!$question || $question->post_type !== 'geometry_question') {
        return new WP_Error('invalid_question', 'Question not found', ['status' => 404]);
    }

    // Create comment as AI response
    $comment_data = [
        'comment_post_ID'      => $post_id,
        'comment_content'      => wp_kses_post($answer),
        'comment_author'       => 'Geometry OS AI',
        'comment_author_email' => 'ai@geometry-os.local',
        'comment_author_url'   => '',
        'comment_type'         => '',
        'comment_approved'     => 1,
    ];

    $comment_id = wp_insert_comment($comment_data);

    if (is_wp_error($comment_id)) {
        return new WP_Error('insert_failed', 'Failed to create answer', ['status' => 500]);
    }

    // Mark as AI response and update question status
    add_comment_meta($comment_id, '_is_ai_response', true);
    update_post_meta($post_id, '_qa_status', 'answered');
    update_post_meta($post_id, '_qa_has_ai_response', true);
    update_post_meta($post_id, '_qa_answered_by', 'Geometry OS AI');

    return rest_ensure_response([
        'success'    => true,
        'comment_id' => $comment_id,
        'message'    => 'Answer posted successfully',
    ]);
}

/**
 * Create new question (for AI)
 */
function geometry_qa_create_question($request) {
    $params = $request->get_json_params();

    $title = sanitize_text_field($params['title'] ?? '');
    $content = wp_kses_post($params['content'] ?? '');
    $category = sanitize_text_field($params['category'] ?? 'Architecture');

    if (empty($title) || empty($content)) {
        return new WP_Error('missing_fields', 'Title and content required', ['status' => 400]);
    }

    // Find or create category
    $term = get_term_by('name', $category, 'question_category');
    if (!$term) {
        $term = wp_insert_term($category, 'question_category');
        $term_id = $term['term_id'];
    } else {
        $term_id = $term->term_id;
    }

    // Create question post
    $post_data = [
        'post_title'   => $title,
        'post_content' => $content,
        'post_status'  => 'publish',
        'post_type'    => 'geometry_question',
        'post_author'  => 0, // AI author
        'meta_input'   => [
            '_qa_status' => 'pending',
        ],
    ];

    $post_id = wp_insert_post($post_data);

    if (is_wp_error($post_id)) {
        return new WP_Error('insert_failed', 'Failed to create question', ['status' => 500]);
    }

    // Set category
    wp_set_post_terms($post_id, [$term_id], 'question_category');

    return rest_ensure_response([
        'success' => true,
        'id'      => $post_id,
        'url'     => get_permalink($post_id),
        'message' => 'Question created successfully',
    ]);
}
```

**Step 2: Verify file created**

Run: `wc -l wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/rest-api.php`
Expected: Shows line count > 100

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/rest-api.php
git commit -m "feat(wp-qa): add REST API endpoints for questions and answers"
```

---

## Task 5: Frontend Shortcode and Template

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/shortcodes.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-qa/templates/questions-list.php`

**Step 1: Write shortcode handler**

```php
<?php
/**
 * Shortcodes for Q&A display
 */

defined('ABSPATH') || exit;

/**
 * Main Q&A list shortcode
 * Usage: [geometry_qa limit="20" category="Architecture"]
 */
function geometry_qa_shortcode($atts) {
    $atts = shortcode_atts([
        'limit'    => 20,
        'category' => '',
        'status'   => '',
    ], $atts);

    $args = [
        'post_type'      => 'geometry_question',
        'posts_per_page' => intval($atts['limit']),
        'orderby'        => 'date',
        'order'          => 'DESC',
    ];

    // Filter by status
    if (!empty($atts['status'])) {
        $args['meta_query'] = [
            [
                'key'     => '_qa_status',
                'value'   => sanitize_text_field($atts['status']),
                'compare' => '=',
            ],
        ];
    }

    // Filter by category
    if (!empty($atts['category'])) {
        $args['tax_query'] = [
            [
                'taxonomy' => 'question_category',
                'field'    => 'slug',
                'terms'    => sanitize_title($atts['category']),
            ],
        ];
    }

    $query = new WP_Query($args);

    ob_start();
    include GEOMETRY_QA_PATH . 'templates/questions-list.php';
    return ob_get_clean();
}
add_shortcode('geometry_qa', 'geometry_qa_shortcode');

/**
 * Ask question form shortcode
 * Usage: [geometry_qa_form]
 */
function geometry_qa_form_shortcode($atts) {
    if (!is_user_logged_in()) {
        return '<p><a href="' . wp_login_url(get_permalink()) . '">Log in</a> to ask a question.</p>';
    }

    $categories = get_terms([
        'taxonomy'   => 'question_category',
        'hide_empty' => false,
    ]);

    ob_start();
    ?>
    <form id="geometry-qa-form" method="post" action="">
        <?php wp_nonce_field('geometry_qa_submit', 'geometry_qa_nonce'); ?>

        <p>
            <label for="qa_title"><strong>Your Question:</strong></label><br>
            <input type="text" id="qa_title" name="qa_title" required
                   style="width:100%; padding:8px; font-size:16px;"
                   placeholder="What would you like to know?">
        </p>

        <p>
            <label for="qa_content"><strong>Details:</strong></label><br>
            <textarea id="qa_content" name="qa_content" rows="5" required
                      style="width:100%; padding:8px;"
                      placeholder="Provide more context..."></textarea>
        </p>

        <p>
            <label for="qa_category"><strong>Category:</strong></label><br>
            <select id="qa_category" name="qa_category" style="padding:8px;">
                <?php foreach ($categories as $cat): ?>
                    <option value="<?php echo esc_attr($cat->slug); ?>">
                        <?php echo esc_html($cat->name); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </p>

        <p>
            <button type="submit" name="qa_submit"
                    style="padding:10px 20px; background:#0073aa; color:white; border:none; cursor:pointer;">
                Ask Question
            </button>
        </p>
    </form>

    <style>
    #geometry-qa-form input:focus,
    #geometry-qa-form textarea:focus {
        border-color: #0073aa;
        outline: none;
        box-shadow: 0 0 3px rgba(0,115,170,0.3);
    }
    </style>
    <?php
    return ob_get_clean();
}
add_shortcode('geometry_qa_form', 'geometry_qa_form_shortcode');

/**
 * Handle form submission
 */
function geometry_qa_handle_form_submission() {
    if (!isset($_POST['qa_submit']) || !isset($_POST['geometry_qa_nonce'])) {
        return;
    }

    if (!wp_verify_nonce($_POST['geometry_qa_nonce'], 'geometry_qa_submit')) {
        wp_die('Security check failed');
    }

    if (!is_user_logged_in()) {
        wp_die('You must be logged in');
    }

    $title = sanitize_text_field($_POST['qa_title']);
    $content = wp_kses_post($_POST['qa_content']);
    $category = sanitize_text_field($_POST['qa_category']);

    $post_data = [
        'post_title'   => $title,
        'post_content' => $content,
        'post_status'  => 'publish',
        'post_type'    => 'geometry_question',
        'post_author'  => get_current_user_id(),
        'meta_input'   => [
            '_qa_status' => 'pending',
        ],
    ];

    $post_id = wp_insert_post($post_data);

    if (!is_wp_error($post_id)) {
        // Set category
        $term = get_term_by('slug', $category, 'question_category');
        if ($term) {
            wp_set_post_terms($post_id, [$term->term_id], 'question_category');
        }

        // Redirect to avoid resubmission
        wp_redirect(get_permalink($post_id) . '?submitted=1');
        exit;
    }
}
add_action('template_redirect', 'geometry_qa_handle_form_submission');
```

**Step 2: Create questions list template**

```bash
mkdir -p wordpress_zone/wordpress/wp-content/plugins/geometry-qa/templates
```

**Step 3: Write template file**

```php
<?php
/**
 * Questions List Template
 *
 * Variables available:
 * - $query: WP_Query object
 * - $atts: Shortcode attributes
 */

defined('ABSPATH') || exit;
?>

<div class="geometry-qa-list">
    <?php if ($query->have_posts()): ?>
        <div class="qa-stats" style="margin-bottom:20px; padding:10px; background:#f5f5f5; border-radius:4px;">
            <?php
            $pending_count = wp_count_posts('geometry_question')->pending;
            printf(_n('%d question', '%d questions', $query->found_posts, 'geometry-qa'), $query->found_posts);
            ?>
        </div>

        <?php while ($query->have_posts()): $query->the_post(); ?>
            <?php
            $status = get_post_meta(get_the_ID(), '_qa_status', true) ?: 'pending';
            $ai_response = get_post_meta(get_the_ID(), '_qa_has_ai_response', true);
            $terms = wp_get_post_terms(get_the_ID(), 'question_category');
            $comment_count = get_comments_number();

            $status_colors = [
                'pending'  => '#f0ad4e',
                'answered' => '#5bc0de',
                'verified' => '#5cb85c',
            ];
            $status_labels = [
                'pending'  => 'Pending',
                'answered' => 'Answered',
                'verified' => 'Verified',
            ];
            ?>
            <article class="qa-question" style="border:1px solid #ddd; margin-bottom:15px; padding:15px; border-radius:4px;">
                <header style="margin-bottom:10px;">
                    <h3 style="margin:0;">
                        <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                    </h3>

                    <div style="margin-top:8px; font-size:13px; color:#666;">
                        <span style="background:<?php echo esc_attr($status_colors[$status]); ?>; color:white; padding:2px 8px; border-radius:3px; margin-right:8px;">
                            <?php echo esc_html($status_labels[$status]); ?>
                        </span>

                        <?php if ($ai_response): ?>
                            <span style="color:#5cb85c;">🤖 AI answered</span>
                        <?php endif; ?>

                        <?php foreach ($terms as $term): ?>
                            <a href="?category=<?php echo esc_attr($term->slug); ?>"
                               style="margin-left:8px; text-decoration:none;">
                                #<?php echo esc_html($term->name); ?>
                            </a>
                        <?php endforeach; ?>

                        <span style="float:right;">
                            <?php echo get_comments_number(); ?> replies
                            &bull;
                            <?php echo get_the_date(); ?>
                        </span>
                    </div>
                </header>

                <div class="qa-excerpt" style="color:#444;">
                    <?php echo wp_trim_words(get_the_excerpt(), 30); ?>
                </div>
            </article>
        <?php endwhile; ?>

        <?php wp_reset_postdata(); ?>

    <?php else: ?>
        <p style="text-align:center; padding:40px; color:#666;">
            No questions yet. <a href="?ask=1">Ask the first one!</a>
        </p>
    <?php endif; ?>
</div>
```

**Step 4: Verify files created**

Run: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-qa/templates/`
Expected: Shows `questions-list.php`

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/includes/shortcodes.php
git add wordpress_zone/wordpress/wp-content/plugins/geometry-qa/templates/questions-list.php
git commit -m "feat(wp-qa): add frontend shortcodes and question list template"
```

---

## Task 6: Python QA Processor Module

**Files:**
- Create: `systems/evolution_daemon/qa_processor.py`
- Create: `systems/evolution_daemon/tests/test_qa_processor.py`

**Step 1: Write the failing test**

```python
"""Tests for QA Processor module."""

import pytest
from unittest.mock import Mock, patch, MagicMock
from systems.evolution_daemon.qa_processor import (
    QaProcessor,
    Question,
    QaConfig,
)


class TestQaProcessor:
    """Test QA Processor functionality."""

    def test_config_defaults(self):
        """Test default configuration values."""
        config = QaConfig()
        assert config.wordpress_url is not None
        assert config.api_token is not None
        assert config.enabled is True
        assert config.max_questions_per_cycle == 5

    def test_fetch_pending_questions_empty(self):
        """Test fetching when no pending questions."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        with patch.object(processor, '_api_get') as mock_get:
            mock_get.return_value = {"count": 0, "questions": []}
            questions = processor.fetch_pending_questions()
            assert questions == []

    def test_fetch_pending_questions_parses_response(self):
        """Test parsing pending questions response."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        mock_response = {
            "count": 2,
            "questions": [
                {
                    "id": 1,
                    "title": "How does evolution work?",
                    "content": "I want to understand the daemon",
                    "categories": ["Evolution"],
                },
                {
                    "id": 2,
                    "title": "Bug in display",
                    "content": "Screen flickers",
                    "categories": ["Bugs"],
                },
            ],
        }

        with patch.object(processor, '_api_get') as mock_get:
            mock_get.return_value = mock_response
            questions = processor.fetch_pending_questions()

            assert len(questions) == 2
            assert questions[0].id == 1
            assert questions[0].title == "How does evolution work?"
            assert questions[1].id == 2

    def test_generate_answer_calls_zai_bridge(self):
        """Test that answer generation uses ZAI Bridge."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        question = Question(
            id=1,
            title="Test question",
            content="What is this?",
            categories=["Architecture"],
        )

        with patch.object(processor, '_call_llm') as mock_llm:
            mock_llm.return_value = "This is a test answer."
            answer = processor.generate_answer(question)

            assert "test answer" in answer
            mock_llm.assert_called_once()

    def test_submit_answer_posts_to_wordpress(self):
        """Test submitting answer via REST API."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        with patch.object(processor, '_api_post') as mock_post:
            mock_post.return_value = {"success": True, "comment_id": 123}
            result = processor.submit_answer(1, "Test answer")

            assert result is True
            mock_post.assert_called_once_with(
                "/answer/1",
                {"answer": "Test answer"}
            )

    def test_process_questions_full_flow(self):
        """Test complete question processing flow."""
        config = QaConfig(api_token="test-token", max_questions_per_cycle=2)
        processor = QaProcessor(config)

        questions = [
            Question(id=1, title="Q1", content="Content 1", categories=["Architecture"]),
            Question(id=2, title="Q2", content="Content 2", categories=["Evolution"]),
        ]

        with patch.object(processor, 'fetch_pending_questions') as mock_fetch:
            with patch.object(processor, 'generate_answer') as mock_gen:
                with patch.object(processor, 'submit_answer') as mock_submit:
                    mock_fetch.return_value = questions
                    mock_gen.side_effect = ["Answer 1", "Answer 2"]
                    mock_submit.return_value = True

                    result = processor.process_questions()

                    assert result["processed"] == 2
                    assert result["failed"] == 0
                    assert mock_gen.call_count == 2
                    assert mock_submit.call_count == 2

    def test_process_questions_stops_on_max(self):
        """Test processing respects max questions limit."""
        config = QaConfig(api_token="test-token", max_questions_per_cycle=1)
        processor = QaProcessor(config)

        questions = [
            Question(id=1, title="Q1", content="C1", categories=["A"]),
            Question(id=2, title="Q2", content="C2", categories=["B"]),
        ]

        with patch.object(processor, 'fetch_pending_questions') as mock_fetch:
            with patch.object(processor, 'generate_answer') as mock_gen:
                with patch.object(processor, 'submit_answer') as mock_submit:
                    mock_fetch.return_value = questions
                    mock_gen.return_value = "Answer"
                    mock_submit.return_value = True

                    result = processor.process_questions()

                    assert result["processed"] == 1  # Only 1 due to limit

    def test_generate_answer_includes_context(self):
        """Test that answer includes question context."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        question = Question(
            id=1,
            title="How does the Hilbert curve work?",
            content="I see references to Hilbert curves in the codebase",
            categories=["Architecture"],
        )

        with patch.object(processor, '_call_llm') as mock_llm:
            mock_llm.return_value = "The Hilbert curve is used for spatial mapping..."
            processor.generate_answer(question)

            # Verify prompt includes question details
            call_args = mock_llm.call_args[0][0]
            assert "Hilbert curve" in call_args
            assert "Architecture" in call_args
```

**Step 2: Run tests to verify they fail**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/evolution_daemon/tests/test_qa_processor.py -v 2>&1 | head -30`
Expected: FAIL with "ModuleNotFoundError" or "ImportError"

**Step 3: Write the implementation**

```python
#!/usr/bin/env python3
"""
Q&A Processor Module

Integrates with Evolution Daemon to process pending WordPress questions
and generate AI responses via ZAI Bridge.

Usage:
    from systems.evolution_daemon.qa_processor import QaProcessor, QaConfig

    config = QaConfig(
        wordpress_url="https://example.com/wp-json",
        api_token="your-token"
    )
    processor = QaProcessor(config)
    result = processor.process_questions()
"""

import json
import logging
import os
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional

import requests

# Add parent for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

logger = logging.getLogger("qa_processor")


@dataclass
class Question:
    """Represents a pending question from WordPress."""
    id: int
    title: str
    content: str
    categories: List[str] = field(default_factory=list)
    author: str = ""
    created: str = ""
    url: str = ""


@dataclass
class QaConfig:
    """Configuration for Q&A Processor."""
    wordpress_url: str = field(default_factory=lambda: os.getenv(
        "WORDPRESS_URL", "http://localhost:8080/wp-json"
    ))
    api_token: str = field(default_factory=lambda: os.getenv(
        "GEOMETRY_QA_API_TOKEN", ""
    ))
    enabled: bool = True
    max_questions_per_cycle: int = 5
    timeout_seconds: int = 30
    llm_model: str = "glm-4-plus"
    llm_temperature: float = 0.7


class QaProcessor:
    """
    Processes pending questions from WordPress and generates AI responses.

    Integrates with:
    - WordPress REST API (geometry-qa/v1 endpoints)
    - ZAI Bridge for LLM responses
    - Evolution Daemon for scheduling
    """

    def __init__(self, config: Optional[QaConfig] = None):
        self.config = config or QaConfig()
        self._processed_count = 0
        self._failed_count = 0
        self._last_run: Optional[datetime] = None

    def fetch_pending_questions(self, category: Optional[str] = None) -> List[Question]:
        """
        Fetch pending questions from WordPress.

        Args:
            category: Optional category filter

        Returns:
            List of Question objects
        """
        if not self.config.enabled:
            logger.debug("Q&A processing disabled")
            return []

        params = {"limit": self.config.max_questions_per_cycle}
        if category:
            params["category"] = category

        response = self._api_get("/pending", params)

        if not response:
            return []

        questions = []
        for q in response.get("questions", []):
            questions.append(Question(
                id=q["id"],
                title=q["title"],
                content=q["content"],
                categories=q.get("categories", []),
                author=q.get("author", ""),
                created=q.get("created", ""),
                url=q.get("url", ""),
            ))

        logger.info(f"Fetched {len(questions)} pending questions")
        return questions

    def generate_answer(self, question: Question) -> str:
        """
        Generate an AI answer for a question.

        Args:
            question: The question to answer

        Returns:
            Generated answer text
        """
        prompt = f"""You are the Geometry OS AI assistant. Answer this question about the Geometry OS project.

Question: {question.title}

Details: {question.content}

Category: {', '.join(question.categories)}

Provide a helpful, technical answer. If you don't know something specific, be honest about it.
Format your response in clear paragraphs. You may use markdown."""

        answer = self._call_llm(prompt)

        # Add signature
        return f"{answer}\n\n---\n*This answer was generated by Geometry OS AI.*"

    def submit_answer(self, question_id: int, answer: str) -> bool:
        """
        Submit an answer to WordPress.

        Args:
            question_id: WordPress post ID
            answer: Answer content

        Returns:
            True if successful
        """
        response = self._api_post(f"/answer/{question_id}", {"answer": answer})

        if response and response.get("success"):
            logger.info(f"Successfully answered question {question_id}")
            return True

        logger.error(f"Failed to answer question {question_id}: {response}")
        return False

    def process_questions(self) -> Dict[str, Any]:
        """
        Main processing loop: fetch pending questions and answer them.

        Returns:
            Dict with 'processed' and 'failed' counts
        """
        if not self.config.enabled:
            return {"processed": 0, "failed": 0, "reason": "disabled"}

        self._last_run = datetime.now()
        processed = 0
        failed = 0

        questions = self.fetch_pending_questions()

        for i, question in enumerate(questions):
            if i >= self.config.max_questions_per_cycle:
                logger.info(f"Reached max questions per cycle: {self.config.max_questions_per_cycle}")
                break

            try:
                logger.info(f"Processing question {question.id}: {question.title}")

                # Generate answer
                answer = self.generate_answer(question)

                # Submit to WordPress
                if self.submit_answer(question.id, answer):
                    processed += 1
                    self._processed_count += 1
                else:
                    failed += 1
                    self._failed_count += 1

            except Exception as e:
                logger.error(f"Error processing question {question.id}: {e}")
                failed += 1
                self._failed_count += 1

        return {
            "processed": processed,
            "failed": failed,
            "total_processed": self._processed_count,
            "total_failed": self._failed_count,
        }

    def ask_question(self, title: str, content: str, category: str = "Architecture") -> Optional[int]:
        """
        Have the AI ask a question (for FAQ generation).

        Args:
            title: Question title
            content: Question details
            category: Category slug

        Returns:
            Question ID if successful
        """
        response = self._api_post("/ask", {
            "title": title,
            "content": content,
            "category": category,
        })

        if response and response.get("success"):
            logger.info(f"Created question: {response.get('id')}")
            return response.get("id")

        return None

    def get_stats(self) -> Dict[str, Any]:
        """Get processor statistics."""
        return {
            "enabled": self.config.enabled,
            "processed_count": self._processed_count,
            "failed_count": self._failed_count,
            "last_run": self._last_run.isoformat() if self._last_run else None,
            "max_per_cycle": self.config.max_questions_per_cycle,
        }

    def _api_get(self, endpoint: str, params: Optional[Dict] = None) -> Optional[Dict]:
        """Make GET request to WordPress REST API."""
        url = f"{self.config.wordpress_url}/geometry-qa/v1{endpoint}"
        headers = {"Authorization": f"Bearer {self.config.api_token}"}

        try:
            response = requests.get(
                url,
                headers=headers,
                params=params,
                timeout=self.config.timeout_seconds
            )
            response.raise_for_status()
            return response.json()
        except requests.RequestException as e:
            logger.error(f"API GET failed: {e}")
            return None

    def _api_post(self, endpoint: str, data: Dict) -> Optional[Dict]:
        """Make POST request to WordPress REST API."""
        url = f"{self.config.wordpress_url}/geometry-qa/v1{endpoint}"
        headers = {
            "Authorization": f"Bearer {self.config.api_token}",
            "Content-Type": "application/json",
        }

        try:
            response = requests.post(
                url,
                headers=headers,
                json=data,
                timeout=self.config.timeout_seconds
            )
            response.raise_for_status()
            return response.json()
        except requests.RequestException as e:
            logger.error(f"API POST failed: {e}")
            return None

    def _call_llm(self, prompt: str) -> str:
        """
        Call LLM via ZAI Bridge.

        Args:
            prompt: The prompt to send

        Returns:
            Generated text
        """
        try:
            # Try to use ZAI Bridge
            from systems.visual_shell.api.zai_bridge import ZAIBridge

            bridge = ZAIBridge()
            response = bridge.chat(
                message=prompt,
                persona="coder",
                temperature=self.config.llm_temperature,
            )

            if response and "content" in response:
                return response["content"]

        except ImportError:
            logger.warning("ZAI Bridge not available, using mock response")

        # Fallback mock response for testing
        return "This is a placeholder response. Please configure ZAI Bridge for real answers."


# Singleton instance
_processor: Optional[QaProcessor] = None


def get_processor(config: Optional[QaConfig] = None) -> QaProcessor:
    """Get or create the global processor instance."""
    global _processor
    if _processor is None:
        _processor = QaProcessor(config)
    return _processor


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Q&A Processor")
    parser.add_argument("--process", action="store_true", help="Process pending questions")
    parser.add_argument("--stats", action="store_true", help="Show stats")
    parser.add_argument("--test", action="store_true", help="Test connection")

    args = parser.parse_args()
    logging.basicConfig(level=logging.INFO)

    processor = get_processor()

    if args.process:
        result = processor.process_questions()
        print(json.dumps(result, indent=2))

    if args.stats:
        print(json.dumps(processor.get_stats(), indent=2))

    if args.test:
        questions = processor.fetch_pending_questions()
        print(f"Found {len(questions)} pending questions")
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/evolution_daemon/tests/test_qa_processor.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/evolution_daemon/qa_processor.py
git add systems/evolution_daemon/tests/test_qa_processor.py
git commit -m "feat(qa): add QA processor module with ZAI Bridge integration"
```

---

## Task 7: Evolution Daemon Integration

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py`

**Step 1: Write test for daemon integration**

Add to `systems/evolution_daemon/tests/test_evolution_daemon.py`:

```python
def test_daemon_includes_qa_processing():
    """Test that daemon includes Q&A processing in cycle."""
    from systems.evolution_daemon.qa_processor import QaConfig

    config = EvolutionDaemonConfig(
        enabled=True,
        qa_config=QaConfig(enabled=True)
    )
    daemon = EvolutionDaemon(config)

    # Should have qa_processor attribute
    assert hasattr(daemon, 'qa_processor')
    assert daemon.qa_processor is not None
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_evolution_daemon.py::test_daemon_includes_qa_processing -v`
Expected: FAIL

**Step 3: Add Q&A integration to daemon**

Find the `EvolutionDaemon.__init__` method and add:

```python
# In imports section
from .qa_processor import QaProcessor, QaConfig

# In EvolutionDaemonConfig dataclass
qa_config: Optional[QaConfig] = None

# In EvolutionDaemon.__init__
if config.qa_config and config.qa_config.enabled:
    self.qa_processor = QaProcessor(config.qa_config)
    logger.info("Q&A processing enabled")
else:
    self.qa_processor = None
```

Find the daemon cycle method (e.g., `_run_cycle` or `evolution_cycle`) and add:

```python
# At the end of each cycle, process Q&A
if self.qa_processor:
    qa_result = self.qa_processor.process_questions()
    if qa_result["processed"] > 0:
        logger.info(f"Q&A: Answered {qa_result['processed']} questions")
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_evolution_daemon.py::test_daemon_includes_qa_processing -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py
git add systems/evolution_daemon/tests/test_evolution_daemon.py
git commit -m "feat(daemon): integrate QA processor into evolution cycles"
```

---

## Task 8: Environment Configuration

**Files:**
- Create: `docs/wordpress-qa-setup.md`

**Step 1: Write setup documentation**

```markdown
# WordPress Q&A System Setup

## Environment Variables

Add these to your `.env` or environment:

```bash
# WordPress connection
WORDPRESS_URL=http://localhost:8080/wp-json

# API token for Q&A endpoints
GEOMETRY_QA_API_TOKEN=your-secure-random-token-here
```

## WordPress Setup

1. **Activate the plugin:**
   - Go to WordPress Admin > Plugins
   - Activate "Geometry OS Q&A"

2. **Set the API token:**
   Add to `wp-config.php`:
   ```php
   define('GEOMETRY_QA_API_TOKEN', 'your-secure-random-token-here');
   ```

3. **Create the Q&A page:**
   - Pages > Add New
   - Title: "Questions & Answers"
   - Content: `[geometry_qa_form]` then `[geometry_qa limit="50"]`
   - Publish

## Testing the Integration

```bash
# Test fetching pending questions
python -c "
from systems.evolution_daemon.qa_processor import QaProcessor, QaConfig
import os
os.environ['GEOMETRY_QA_API_TOKEN'] = 'your-token'
os.environ['WORDPRESS_URL'] = 'http://localhost:8080/wp-json'

p = QaProcessor(QaConfig())
print(p.fetch_pending_questions())
"

# Process questions manually
python systems/evolution_daemon/qa_processor.py --process
```

## REST API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/wp-json/geometry-qa/v1/pending` | GET | List pending questions |
| `/wp-json/geometry-qa/v1/answer/{id}` | POST | Submit answer |
| `/wp-json/geometry-qa/v1/ask` | POST | Create question |

All endpoints require `Authorization: Bearer <token>` header.
```

**Step 2: Commit**

```bash
git add docs/wordpress-qa-setup.md
git commit -m "docs: add WordPress Q&A setup guide"
```

---

## Task 9: Final Integration Test

**Files:**
- Create: `systems/evolution_daemon/tests/test_qa_integration.py`

**Step 1: Write integration test**

```python
"""Integration tests for Q&A system."""

import pytest
from unittest.mock import Mock, patch, MagicMock
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.evolution_daemon.qa_processor import QaProcessor, QaConfig, Question


class TestQaIntegration:
    """End-to-end integration tests."""

    @pytest.fixture
    def mock_wordpress(self):
        """Mock WordPress REST API responses."""
        with patch('requests.get') as mock_get, \
             patch('requests.post') as mock_post:

            mock_get.return_value = MagicMock(
                status_code=200,
                json=lambda: {
                    "count": 1,
                    "questions": [{
                        "id": 1,
                        "title": "Test Question",
                        "content": "What is this?",
                        "categories": ["Architecture"],
                    }]
                }
            )

            mock_post.return_value = MagicMock(
                status_code=200,
                json=lambda: {"success": True, "comment_id": 123}
            )

            yield mock_get, mock_post

    def test_full_flow_processes_question(self, mock_wordpress):
        """Test complete flow: fetch -> answer -> submit."""
        config = QaConfig(
            api_token="test-token",
            wordpress_url="http://test.local/wp-json",
            enabled=True
        )
        processor = QaProcessor(config)

        # Mock LLM response
        with patch.object(processor, '_call_llm', return_value="Test answer"):
            result = processor.process_questions()

        assert result["processed"] == 1
        assert result["failed"] == 0

    def test_category_filtering(self, mock_wordpress):
        """Test filtering by category."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        questions = processor.fetch_pending_questions(category="Evolution")

        # Should have called API with category param
        mock_get, _ = mock_wordpress
        call_params = mock_get.call_args[1].get('params', {})
        assert 'category' in call_params

    def test_graceful_handling_of_api_failure(self):
        """Test handling when WordPress is unreachable."""
        config = QaConfig(api_token="test-token")
        processor = QaProcessor(config)

        with patch('requests.get', side_effect=Exception("Connection failed")):
            questions = processor.fetch_pending_questions()
            assert questions == []
```

**Step 2: Run integration tests**

Run: `python -m pytest systems/evolution_daemon/tests/test_qa_integration.py -v`
Expected: All tests PASS

**Step 3: Run full test suite**

Run: `python -m pytest systems/evolution_daemon/tests/test_qa*.py -v`
Expected: All tests PASS

**Step 4: Commit**

```bash
git add systems/evolution_daemon/tests/test_qa_integration.py
git commit -m "test(qa): add integration tests for Q&A system"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Plugin scaffold | `geometry-qa.php` |
| 2 | Question post type | `includes/post-type.php` |
| 3 | Status field | `includes/status-field.php` |
| 4 | REST API | `includes/rest-api.php` |
| 5 | Shortcodes + template | `includes/shortcodes.php`, `templates/questions-list.php` |
| 6 | QA Processor | `qa_processor.py`, `test_qa_processor.py` |
| 7 | Daemon integration | `evolution_daemon.py` |
| 8 | Documentation | `docs/wordpress-qa-setup.md` |
| 9 | Integration tests | `test_qa_integration.py` |
