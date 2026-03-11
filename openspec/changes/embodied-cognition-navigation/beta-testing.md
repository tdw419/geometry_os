# Embodied Cognition Navigation - Beta Testing Plan

## Overview

This document outlines the beta testing process for the Embodied Cognition Navigation UX feature. The goal is to gather structured feedback from beta testers to iterate on the design and implementation.

## Testing Phases

### Phase 1: Internal Dogfooding (Week 1-2)

**Participants**: Development team members
**Goal**: Identify bugs, performance issues, and major UX problems

#### Tasks
1. Navigate through a complex neural visualization (100+ nodes)
2. Select multiple nodes using different methods (click, gesture, rectangle)
3. Track emotional state changes over time
4. Use temporal ghost overlay to understand state evolution
5. Draw gestures to execute commands

#### Feedback Collection
- Daily standup discussions
- Bug tracking in GitHub issues
- Performance profiling logs

### Phase 2: Alpha Testing (Week 3-4)

**Participants**: 5-10 trusted users with varying technical backgrounds
**Goal**: Validate usability and gather qualitative feedback

#### Participant Profiles
| ID | Background | Neural Viz Experience | Accessibility Needs |
|----|------------|----------------------|---------------------|
| A1 | ML Researcher | Expert | None |
| A2 | Software Engineer | Intermediate | None |
| A3 | Data Scientist | Beginner | Color blind |
| A4 | UX Designer | None | Reduced motion |
| A5 | Student | Beginner | None |

#### Structured Tasks

##### Task 1: Basic Navigation (5 min)
- Find a specific high-activation node in the visualization
- Navigate to it using momentum camera
- Report: Was navigation intuitive? Did momentum feel natural?

##### Task 2: Node Selection (5 min)
- Select 5 nodes using different methods
- Use click selection
- Use circle gesture to select a region
- Report: Which method felt more natural? Why?

##### Task 3: State Tracking (10 min)
- Watch the visualization for 2 minutes
- Identify periods of high confidence
- Identify periods of exploration
- Report: Could you understand the emotional state from colors alone?

##### Task 4: Temporal Analysis (10 min)
- Enable temporal ghost overlay
- Identify when a significant change occurred
- Describe what changed over time
- Report: Did ghost overlays help understand state evolution?

##### Task 5: Gesture Commands (5 min)
- Draw a circle to select a region
- Draw a line to navigate
- Draw a checkmark to confirm
- Report: Which gestures were easy/hard to draw? Recognition accuracy?

#### Interview Questions
1. How would you describe the "feel" of navigating the neural space?
2. What was the most confusing part of the experience?
3. What felt the most natural/intuitive?
4. Would you prefer this over traditional static visualization? Why?
5. What would make this more useful for your work?

### Phase 3: Public Beta (Week 5-8)

**Participants**: Open beta signup (target: 50-100 users)
**Goal**: Gather quantitative usage data and broad feedback

#### Telemetry Collection

```json
{
  "session_id": "uuid",
  "timestamp": "ISO8601",
  "events": [
    {
      "type": "camera_move",
      "duration_ms": 1500,
      "distance": 45.2,
      "method": "momentum"
    },
    {
      "type": "pulse_emitted",
      "pulse_type": "selection",
      "node_count": 1
    },
    {
      "type": "gesture_recognized",
      "gesture_type": "circle",
      "confidence": 0.85,
      "duration_ms": 800
    },
    {
      "type": "emotional_state_change",
      "from": "Processing",
      "to": "Confident",
      "transition_ms": 1200
    },
    {
      "type": "ghost_snapshot_captured",
      "total_snapshots": 15
    }
  ],
  "session_summary": {
    "total_duration_ms": 300000,
    "camera_moves": 42,
    "pulses_emitted": 18,
    "gestures_recognized": 7,
    "avg_fps": 58.3,
    "accessibility_mode": false
  }
}
```

#### In-App Feedback Widget

After 5 minutes of use:
> "How is your experience so far?"
> - 😊 Great
> - 😐 Okay
> - 😞 Frustrating
> - [Optional comment]

After significant interaction:
> "Was that interaction intuitive?"
> - 👍 Yes
> - 👎 No
> - [What would make it better?]

#### Weekly Surveys

**Week 5 Survey**: First Impressions
- Rate navigation feel (1-5)
- Rate visual feedback quality (1-5)
- Most memorable feature (free text)
- Biggest pain point (free text)

**Week 6 Survey**: Feature Deep Dive
- Which gesture do you use most? (dropdown)
- Do you use temporal ghosts? (yes/no/sometimes)
- Is emotional coloring helpful? (yes/no/sometimes)
- Feature requests (free text)

**Week 7 Survey**: Performance & Accessibility
- Any performance issues? (yes/no + describe)
- Did you try accessibility modes? (yes/no)
- Suggestions for improvement (free text)

**Week 8 Survey**: Final Assessment
- Would you recommend this feature? (NPS 0-10)
- What's the #1 thing to fix before release?
- What's the #1 thing you love?
- Any final comments?

### Phase 4: Analysis & Iteration (Week 9+)

#### Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Engagement Time | 2x vs static | Session duration comparison |
| Task Completion | 50% faster | Timed task completion |
| Error Recovery | 3x faster | Time to identify/correct errors |
| NPS Score | > 30 | Final survey NPS |
| Gesture Accuracy | > 85% | Recognition confidence average |
| FPS with Effects | > 55 | Average FPS under load |

#### Feedback Categorization

1. **Critical**: Blocks basic usage (P0 - fix immediately)
2. **Major**: Significantly impacts experience (P1 - fix before release)
3. **Minor**: Annoying but not blocking (P2 - fix post-release)
4. **Enhancement**: Nice to have (P3 - backlog)

#### Iteration Process

1. **Triage**: Categorize all feedback weekly
2. **Prioritize**: Rank by impact and effort
3. **Implement**: Address top issues
4. **Verify**: Confirm fix with reporter
5. **Release**: Deploy to beta channel
6. **Repeat**: Weekly cycle during beta

## Accessibility Testing

### Color Blind Testing
- Verify emotional states distinguishable in deuteranopia/protanopia/tritanopia modes
- Add shape/icon supplements to color coding
- Test with actual color blind users

### Motion Sensitivity Testing
- Verify reduced motion mode eliminates motion sickness triggers
- Test with users who experience motion sensitivity
- Provide instant stop option for camera momentum

### Keyboard Navigation
- Verify all features accessible via keyboard
- Test with screen reader
- Ensure focus management is correct

## Feedback Form Template

```
# Embodied Cognition Navigation - Feedback Form

## Session Info
- Date: ___________
- Participant ID: ___________
- Phase: [ ] Internal [ ] Alpha [ ] Beta
- Session Duration: ___________

## Navigation Experience
1. How natural did camera movement feel? (1-5): ____
2. Did momentum help or hinder navigation? (Help/Hinder/Mixed): ____
3. Comments on navigation: _________________________________

## Visual Feedback
1. Were pulse effects helpful? (1-5): ____
2. Did emotional colors convey state? (1-5): ____
3. Were temporal ghosts useful? (1-5): ____
4. Comments on visual feedback: ____________________________

## Gesture Recognition
1. Which gestures did you try? _____________________________
2. Recognition accuracy (1-5): ____
3. Which gesture felt most natural? _________________________
4. Gesture suggestions: ____________________________________

## Performance
1. Any lag or stuttering? (Yes/No): ____
2. If yes, describe: ______________________________________
3. Average FPS observed (if known): ____

## Overall
1. Rate overall experience (1-5): ____
2. Would you use this regularly? (Yes/No/Maybe): ____
3. Top 3 things to improve:
   - __________________________________________________
   - __________________________________________________
   - __________________________________________________
4. Top 3 things you liked:
   - __________________________________________________
   - __________________________________________________
   - __________________________________________________

## Additional Comments
_________________________________________________________
_________________________________________________________
```

## Contact & Support

- Beta Coordinator: [TBD]
- Bug Reports: GitHub Issues with label `embodied-cognition`
- Feature Requests: GitHub Discussions
- Urgent Issues: Slack #embodied-cognition-beta
