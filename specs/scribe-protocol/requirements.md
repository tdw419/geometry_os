---
spec: scribe-protocol
phase: requirements
created: 2026-02-23
---

# Requirements: Scribe Protocol

## Goal

Expert-in-the-loop mentorship system for World of Rectification where experienced players (Scribes) guide newcomers (Sprouts) through quests, generating training data for Ghost Mentor AI agents.

## User Decisions (Interview Responses)

| Question | Response |
|----------|----------|
| Problem type | Adding new functionality |
| Constraints | No special constraints |
| Success criteria | Tests pass and code works |
| Primary users | End users via UI |
| Priority | Code quality > maintainability > speed |
| Feature success | Feature works as specified |

---

## User Stories

### US-1: Scribe Registration
**As a** player with TMS level 3+
**I want to** register as a Scribe with my cohort type
**So that** I can mentor new players and contribute to AI training

**Acceptance Criteria:**
- [ ] AC-1.1: POST `/wor/v1/scribe/register` accepts `cohort` (internal|community|domain_expert) and optional `expertise` array
- [ ] AC-1.2: Duplicate registration returns error (not duplicate record)
- [ ] AC-1.3: Record created in `wp_wor_scribes` table with correct cohort
- [ ] AC-1.4: Welcome email sent to user's registered email
- [ ] AC-1.5: Unauthenticated requests return 401

### US-2: Cohort-Based Onboarding
**As a** newly registered Scribe
**I want to** complete onboarding steps specific to my cohort
**So that** I learn how to effectively mentor Sprouts

**Acceptance Criteria:**
- [ ] AC-2.1: GET `/wor/v1/scribe/onboarding` returns current step, total steps, progress percentage
- [ ] AC-2.2: Internal cohort: 5 steps (Architecture, Code Tour, Samples, Pipeline, Quiz)
- [ ] AC-2.3: Community cohort: 5 steps (WoR Intro, Sefirot, Practice, Vibe Coding, Quiz)
- [ ] AC-2.4: Domain Expert cohort: 5 steps (Expertise Form, Integration, Sample, Review, Quiz)
- [ ] AC-2.5: POST `/wor/v1/scribe/complete-step` advances step on success
- [ ] AC-2.6: Quiz step validates answers against `correct` index, requires passing_score
- [ ] AC-2.7: Final step completion sets `onboarding_completed=1` and `ghost_training_eligible=1`
- [ ] AC-2.8: Failed quiz returns score, passing_score, allows retry

### US-3: Sprout Help Request
**As a** player stuck on a quest
**I want to** request help from an available Scribe
**So that** I can get guidance without quitting the quest

**Acceptance Criteria:**
- [ ] AC-3.1: POST `/wor/v1/transmission/request` accepts `quest_id`, `topic` (optional)
- [ ] AC-3.2: Request adds Sprout to waiting queue with timestamp
- [ ] AC-3.3: Request creates/updates `wp_wor_sprouts` record for user
- [ ] AC-3.4: Visual Bridge receives broadcast at port 8769 `/agent/request`
- [ ] AC-3.5: If already in active session, return existing transmission_id
- [ ] AC-3.6: Response includes queue position

### US-4: Scribe Accepts Help Request
**As a** certified Scribe
**I want to** see and accept waiting Sprouts
**So that** I can begin a mentorship session

**Acceptance Criteria:**
- [ ] AC-4.1: GET `/wor/v1/transmission/queue` returns array of waiting Sprouts
- [ ] AC-4.2: POST `/wor/v1/transmission/accept` with `sprout_id` creates session
- [ ] AC-4.3: Scribe must have `onboarding_completed=1` to accept
- [ ] AC-4.4: Session created in `wp_wor_transmissions` with status `active`
- [ ] AC-4.5: System message "Transmission started" inserted
- [ ] AC-4.6: Sprout removed from queue atomically
- [ ] AC-4.7: If Sprout already claimed, return error

### US-5: Real-Time Chat
**As a** Scribe or Sprout in a session
**I want to** send and receive messages in real-time
**So that** mentorship can flow naturally

**Acceptance Criteria:**
- [ ] AC-5.1: POST `/wor/v1/transmission/{id}/send` accepts `message`, `sender_type` (scribe|sprout)
- [ ] AC-5.2: GET `/wor/v1/transmission/{id}/messages?last={id}` returns new messages since last_id
- [ ] AC-5.3: Messages sanitized with `sanitize_textarea_field()`
- [ ] AC-5.4: Empty messages rejected with error
- [ ] AC-5.5: Polling returns `session_status` (active|completed|abandoned)
- [ ] AC-5.6: Messages include `sender_type`, `sender_id`, `created_at`
- [ ] AC-5.7: Frontend polls every 2-3 seconds (jQuery-based)

### US-6: Session Completion
**As a** Sprout
**I want to** end the session and rate my Scribe
**So that** feedback improves future mentorship

**Acceptance Criteria:**
- [ ] AC-6.1: POST `/wor/v1/transmission/{id}/end` accepts `rating` (1-5), `feedback` (optional)
- [ ] AC-6.2: Session status updated to `completed`
- [ ] AC-6.3: `duration_seconds` calculated from started_at to ended_at
- [ ] AC-6.4: Scribe's `mentorship_count` incremented
- [ ] AC-6.5: Sprout's `total_sessions` incremented, `assigned_scribe_id` cleared
- [ ] AC-6.6: Session queued for training export via WP Cron
- [ ] AC-6.7: Already-ended sessions return error

### US-7: Intent Classification
**As a** system
**I want to** classify Scribe messages by intent
**So that** training data is labeled for Ghost Mentor AI

**Acceptance Criteria:**
- [ ] AC-7.1: Async classification via `wp_schedule_single_event()` 5 seconds after message
- [ ] AC-7.2: Intent patterns: explanation, hint, encouragement, clarification, redirect
- [ ] AC-7.3: Classification updates `intent_label` on message record
- [ ] AC-7.4: Intent cluster `message_count` incremented
- [ ] AC-7.5: Sample phrases capped at 20 most recent per intent

### US-8: Training Data Export
**As an** admin
**I want to** export training-ready transmission data
**So that** Ghost Mentors can be fine-tuned

**Acceptance Criteria:**
- [ ] AC-8.1: GET `/wor/v1/training/stats` returns admin-only stats
- [ ] AC-8.2: Stats include total transmissions, messages, intent distribution, avg rating
- [ ] AC-8.3: `training_eligible` boolean (50+ transmissions, 3.5+ avg rating)
- [ ] AC-8.4: Export format: `{metadata, messages[]}` with role (assistant|user), content, intent
- [ ] AC-8.5: Admin-only endpoint requires `manage_options` capability

### US-9: Scribe Dashboard UI
**As a** Scribe
**I want to** see my dashboard with onboarding progress and waiting Sprouts
**So that** I can manage my mentorship activity

**Acceptance Criteria:**
- [ ] AC-9.1: Shortcode `[wor_scribe_dashboard]` renders dashboard
- [ ] AC-9.2: Dashboard shows onboarding progress bar
- [ ] AC-9.3: Dashboard shows waiting Sprout queue (if certified)
- [ ] AC-9.4: Dashboard shows session history (last 10)
- [ ] AC-9.5: Non-Scribes see registration form
- [ ] AC-9.6: Responsive layout (mobile-friendly)

### US-10: Sprout Help Button
**As a** Sprout on a quest
**I want to** click a help button that opens a chat widget
**So that** I can quickly get assistance

**Acceptance Criteria:**
- [ ] AC-10.1: Help button rendered in quest template (via shortcode or template tag)
- [ ] AC-10.2: Click opens chat widget modal
- [ ] AC-10.3: Widget shows queue position while waiting
- [ ] AC-10.4: Widget shows chat interface when session active
- [ ] AC-10.5: Widget polls for messages every 2 seconds
- [ ] AC-10.6: Widget shows "Rate Session" form on completion

---

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | Scribe registration with cohort selection | P0 | US-1 AC-1.1 to AC-1.5 |
| FR-2 | Cohort-specific onboarding flows | P0 | US-2 AC-2.1 to AC-2.8 |
| FR-3 | Sprout help request queue | P0 | US-3 AC-3.1 to AC-3.6 |
| FR-4 | Scribe accepts from queue | P0 | US-4 AC-4.1 to AC-4.7 |
| FR-5 | Real-time chat with polling | P0 | US-5 AC-5.1 to AC-5.7 |
| FR-6 | Session end with rating | P0 | US-6 AC-6.1 to AC-6.7 |
| FR-7 | Async intent classification | P1 | US-7 AC-7.1 to AC-7.5 |
| FR-8 | Training data export | P1 | US-8 AC-8.1 to AC-8.5 |
| FR-9 | Scribe dashboard shortcode | P1 | US-9 AC-9.1 to AC-9.6 |
| FR-10 | Sprout help button widget | P1 | US-10 AC-10.1 to AC-10.6 |
| FR-11 | Stale session cleanup (30 min) | P1 | Hourly cron marks inactive sessions as abandoned |
| FR-12 | Queue entry expiration (1 hour) | P2 | Entries older than 1 hour removed from queue |

---

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | API Response Time | p95 latency | < 500ms |
| NFR-2 | Chat Polling | Poll interval | 2-3 seconds |
| NFR-3 | Intent Classification | Async delay | 5 seconds after message |
| NFR-4 | Queue Concurrency | Race condition prevention | Atomic accept via WordPress DB locks |
| NFR-5 | Database | Table prefix | Must use `{$wpdb->prefix}wor_` |
| NFR-6 | Code Style | WordPress Coding Standards | `phpcs --standard=WordPress` clean |
| NFR-7 | PHP Version | Minimum | 7.4+ |
| NFR-8 | WordPress | Minimum | 5.6+ |

---

## Glossary

| Term | Definition |
|------|------------|
| **Scribe** | Certified mentor player (TMS level 3+) |
| **Sprout** | New player requesting help |
| **Transmission** | Single mentorship session between Scribe and Sprout |
| **Cohort** | Scribe category: internal (team), community (volunteer), domain_expert (specialist) |
| **Ghost Mentor** | AI agent trained from Scribe transmission data |
| **Intent** | Classification label for Scribe message purpose |
| **CTRM** | Cognitive Transparent Reasoning Model - WoR's scoring system |
| **TMS** | Truth Management System - level progression |
| **Visual Bridge** | WebSocket server at port 8768/8769 for real-time events |

---

## Out of Scope

- WebSocket-based chat (polling only for MVP)
- ML-based intent classification (regex patterns only)
- Scribe-to-Scribe messaging
- Multi-Scribe sessions
- File/image sharing in chat
- Voice/video transmission
- Payment for Scribe services
- GuildAgent Python backend integration (see transmission-protocol spec)

---

## Dependencies

| Dependency | Type | Status | Notes |
|------------|------|--------|-------|
| World of Rectification plugin | External | Exists | Base plugin being extended |
| Visual Bridge | External | Running | HTTP endpoint at port 8769 |
| WordPress REST API | Platform | Available | `wor/v1` namespace |
| WP Cron | Platform | Available | For async tasks |
| jQuery | Frontend | Available | For AJAX polling |

---

## Success Criteria

| Metric | Target | Measurement |
|--------|--------|-------------|
| All P0 user stories | 100% passing AC | Manual test + code review |
| API endpoint coverage | 100% functional | `curl` tests against all endpoints |
| PHP syntax | 0 errors | `php -l` on all new files |
| Database tables | 5 tables created | Verify via phpMyAdmin |
| Onboarding flows | 3 cohorts complete | Walk through each flow |

---

## Risks

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| Race condition on queue accept | High | Medium | Use WordPress `$wpdb->query()` with WHERE clause, check affected rows |
| Visual Bridge not running | Medium | Low | Fallback: queue still works, notification silently fails |
| Polling overhead | Medium | Low | 2-3 second interval, limit 100 messages per poll |
| Regex intent accuracy | Medium | High | Document as MVP, plan ML upgrade path |
| Session abandonment | Low | High | 30-minute stale cleanup handles gracefully |

---

## Unresolved Questions

1. **Ghost Mentor Training Threshold**: Plan says 3.5/5 rating with 50+ transmissions - should this be configurable?
2. **Export Format**: JSONL for OpenAI fine-tuning or custom format?
3. **Scribe Certification Revocation**: If rating drops below threshold, should certification be revoked?
4. **Cross-Session Context**: Should Sprout see previous session history with same Scribe?
5. **Intent Pattern Expansion**: Community-contributed intent patterns - how to moderate?

---

## Next Steps

1. Create database tables on plugin activation (5 tables)
2. Implement `WOR_Scribe_Portal` class following singleton pattern
3. Implement `WOR_Transmission_Session` class with queue management
4. Implement `WOR_Mentor_Data_Pipeline` class with intent classification
5. Create `WOR_Scribe_API` class with REST endpoints
6. Add frontend shortcodes: `[wor_scribe_dashboard]`, `[wor_help_button]`
7. Write jQuery chat widget for polling
8. Test all AC with `curl` and manual walkthrough
