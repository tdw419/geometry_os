# Accessibility User Testing Plan

**Document Version**: 1.0
**Last Updated**: March 11, 2026
**Compliance Target**: WCAG 2.1 Level AA

## Overview

This document outlines a comprehensive user testing plan to verify keyboard navigation and screen reader support in the Geometry OS Visual Shell with individuals using assistive technologies.

---

## Testing Objectives

### Primary Objectives
1. Verify keyboard navigation works seamlessly throughout the shell
2. Validate screen reader compatibility and announcement accuracy
3. Test ARIA label effectiveness for assistive technology users
4. Assess overall user experience with assistive devices
5. Identify accessibility barriers and areas for improvement

### Success Criteria
- 90% of participants can complete core tasks using keyboard only
- 85% of participants rate screen reader experience as "Good" or "Excellent"
- All WCAG 2.1 Level AA requirements are met
- Zero critical accessibility blockers identified

---

## Participant Recruitment

### Target Demographics

#### Group 1: Screen Reader Users (6-8 participants)
- **Primary assistive technology**: NVDA, JAWS, or VoiceOver
- **Experience level**: Intermediate to advanced
- **Browser preference**: Chrome, Firefox, or Safari
- **Operating system**: Windows, macOS, or Linux

#### Group 2: Keyboard-Only Users (4-6 participants)
- **Navigation method**: Keyboard only (no mouse)
- **Reasons**: Motor impairments, preference, or RSI
- **Experience level**: Intermediate to advanced web users

#### Group 3: Magnification Users (3-4 participants)
- **Assistive technology**: ZoomText, MAGic, or browser zoom
- **Vision level**: Low vision
- **Experience level**: Intermediate

### Recruitment Channels
- Accessibility community forums (WebAIM, A11y Slack)
- Local disability advocacy organizations
- Professional accessibility testing services
- University disability services
- Social media outreach (#a11y, #Accessibility)

### Participant Requirements
- Age 18+
- Ability to provide informed consent
- Regular web browser user (2+ hours/week)
- Familiar with own assistive technology
- Willingness to share honest feedback

---

## Testing Methodology

### Session Structure

#### Duration: 60-90 minutes per participant

#### Format: Remote or in-person
- **Remote**: Via Zoom/Google Meet with screen sharing
- **In-person**: At accessible testing facility

#### Compensation: $75-150 per session (based on duration)

### Session Timeline

| Phase | Duration | Activities |
|-------|----------|------------|
| Introduction | 5-10 min | Welcome, consent, demographics |
| Setup & Calibration | 5-10 min | AT setup, browser check |
| Task-Based Testing | 35-45 min | Core tasks (see below) |
| Exploration | 10-15 min | Free exploration, questions |
| Debrief & Feedback | 10-15 min | Interview, SUS questionnaire |

---

## Test Tasks

### Task 1: Basic Navigation (5-7 minutes)
**Objective**: Verify skip links and zone navigation

**Instructions**:
1. Load the Visual Shell application
2. Navigate to the main canvas using skip links
3. Use F6 to cycle through all application zones
4. Return to the spawner panel
5. Navigate to the system dashboard

**Success Metrics**:
- [ ] Skip links are discoverable and functional
- [ ] F6 cycles through all zones in logical order
- [ ] Focus indicators are visible and clear
- [ ] Zone announcements are accurate

**Questions**:
- Were you able to navigate efficiently between areas?
- Were the announcements helpful in understanding your location?
- Did focus indicators provide adequate visual feedback?

---

### Task 2: Process Management (10-12 minutes)
**Objective**: Test process spawning and monitoring with keyboard

**Instructions**:
1. Navigate to the file drop zone
2. Upload a .spv file using keyboard (provide test file)
3. Verify process appears in process list
4. Navigate the process list using arrow keys
5. Focus on the spawned process
6. Check process details in the dashboard

**Success Metrics**:
- [ ] Drop zone is keyboard accessible
- [ ] File upload can be triggered without mouse
- [ ] Process list is navigable with arrow keys
- [ ] Process state changes are announced
- [ ] Dashboard updates are accessible

**Questions**:
- Was the file upload process intuitive?
- Could you track process status effectively?
- Were state changes announced clearly?

---

### Task 3: Canvas Interaction (8-10 minutes)
**Objective**: Verify canvas keyboard controls

**Instructions**:
1. Navigate to the visual canvas
2. Pan the view using arrow keys (up, down, left, right)
3. Zoom in using the plus key
4. Zoom out using the minus key
5. Reset camera to home position using Home key
6. Navigate to a specific process location

**Success Metrics**:
- [ ] Arrow keys pan the canvas smoothly
- [ ] Zoom controls work correctly
- [ ] Position announcements are accurate
- [ ] Home key resets view successfully
- [ ] Focus remains on canvas during navigation

**Questions**:
- Were the canvas controls intuitive?
- Did announcements help you understand your position?
- Was the navigation smooth and predictable?

---

### Task 4: Screen Reader Experience (10-15 minutes)
**Objective**: Validate ARIA labels and live regions

**Instructions**:
1. Load application and listen to boot sequence
2. Navigate through all panels with screen reader
3. Spawn a new process
4. Monitor process state changes
5. Check IPC channel updates
6. Toggle kernel saccades feature
7. Open and close brain picker dialog

**Success Metrics**:
- [ ] Boot progress is announced appropriately
- [ ] All UI elements have descriptive labels
- [ ] Live region updates are announced
- [ ] Process state changes are communicated
- [ ] Dialog has proper focus trap
- [ ] Modal interactions are accessible

**Questions**:
- Were all UI elements properly labeled?
- Did live updates interrupt at appropriate times?
- Were dialog interactions accessible?
- What information was missing or unclear?

---

### Task 5: High Contrast & Preferences (5-7 minutes)
**Objective**: Test accessibility preference toggles

**Instructions**:
1. Toggle high contrast mode (Ctrl+Shift+H)
2. Verify color scheme changes
3. Toggle reduced motion mode
4. Verify animations are disabled
5. Toggle screen reader mode
6. Test enhanced announcements

**Success Metrics**:
- [ ] High contrast mode activates correctly
- [ ] Color changes are perceivable
- [ ] Reduced motion disables animations
- [ ] Screen reader mode enhances experience
- [ ] Preferences persist across sessions

**Questions**:
- Did the visual changes meet your needs?
- Were the preference toggles easy to discover?
- Should any additional preferences be offered?

---

### Task 6: Error Recovery (5-7 minutes)
**Objective**: Test error handling and recovery

**Instructions**:
1. Attempt to upload an invalid file type
2. Try to navigate to a non-existent process
3. Trigger an error condition (test script provided)
4. Attempt recovery using keyboard

**Success Metrics**:
- [ ] Error messages are announced
- [ ] Errors are described clearly
- [ ] Recovery actions are accessible
- [ ] Focus management handles errors gracefully

**Questions**:
- Were error messages clear and actionable?
- Could you recover from errors easily?
- What additional error information would help?

---

## Assistive Technology Test Matrix

### Screen Readers

| Screen Reader | Browser | OS | Priority | Participants |
|---------------|---------|----|----------| -------------|
| NVDA 2024+ | Firefox | Windows | High | 2-3 |
| NVDA 2024+ | Chrome | Windows | High | 2-3 |
| JAWS 2024+ | Chrome | Windows | Medium | 1-2 |
| VoiceOver | Safari | macOS | High | 2-3 |
| VoiceOver | Safari | iOS | Medium | 1-2 |
| Orca | Firefox | Linux | Low | 1 |

### Browser Testing

| Browser | Version | OS | AT Compatibility |
|---------|---------|----|--------------------|
| Chrome | Latest | Win/Mac/Linux | JAWS, NVDA, VoiceOver |
| Firefox | Latest | Win/Mac/Linux | NVDA, JAWS, Orca |
| Safari | Latest | macOS/iOS | VoiceOver |
| Edge | Latest | Windows | JAWS, NVDA |

### Keyboard Configurations

- Standard QWERTY keyboard
- Compact laptop keyboard
- Alternative keyboard layouts (Dvorak, Colemak)
- One-handed keyboard navigation
- Switch access devices (if applicable)

---

## Data Collection

### Quantitative Measures

#### System Usability Scale (SUS)
- 10-question standardized questionnaire
- Score range: 0-100
- Target: ≥68 (above average)

#### Task Success Rate
- Percentage of tasks completed successfully
- Target: ≥90% for all user groups

#### Time on Task
- Average completion time per task
- Compare to baseline (mouse users)

#### Error Rate
- Number of errors per task
- Types of errors encountered

### Qualitative Measures

#### Post-Task Interviews
- Think-aloud protocol during tasks
- Follow-up questions after each task
- General impressions and feedback

#### Post-Session Questionnaire
- Overall satisfaction rating (1-5)
- Most/least accessible features
- Suggestions for improvement
- Comparison to other web applications

#### Observer Notes
- Areas of confusion
- Unexpected behaviors
- Emotional responses
- Strategies used

---

## Reporting

### Accessibility Test Report Template

#### 1. Executive Summary
- Overall accessibility rating
- Critical issues found
- Recommendations summary

#### 2. Participant Demographics
- Total participants
- Assistive technologies used
- Experience levels

#### 3. Task Results
- Success rates per task
- Time on task analysis
- Error analysis

#### 4. Issues Found
**Critical** (blocks usage):
- Issue description
- Affected users
- Reproduction steps
- Recommended fix
- Priority

**Serious** (significant barrier):
- Issue description
- Affected users
- Recommended fix
- Priority

**Minor** (inconvenience):
- Issue description
- Recommended improvement
- Priority

#### 5. Compliance Status
- WCAG 2.1 Level A checklist
- WCAG 2.1 Level AA checklist
- Gaps and remediation plan

#### 6. Quotes & Feedback
- Positive feedback
- Constructive criticism
- Suggestions

#### 7. Recommendations
- Immediate fixes (0-2 weeks)
- Short-term improvements (1-2 months)
- Long-term enhancements (3-6 months)

---

## Testing Schedule

### Phase 1: Pilot Testing (Week 1-2)
- 2-3 internal testers with AT experience
- Refine test protocol
- Identify major issues

### Phase 2: Main Testing (Week 3-5)
- 12-16 external participants
- All user groups represented
- Full task coverage

### Phase 3: Analysis & Reporting (Week 6)
- Data analysis
- Report compilation
- Issue prioritization

### Phase 4: Remediation (Week 7-10)
- Critical issue fixes
- Re-test with affected users
- Documentation updates

---

## Testing Environment

### Technical Requirements

#### For Remote Testing
- Stable internet connection (participant and facilitator)
- Screen sharing capability (Zoom, Google Meet)
- Recording software (with consent)
- Accessibility testing tools installed

#### For In-Person Testing
- Accessible testing facility
- Quiet, distraction-free room
- Participant's own device (BYOD) or test device
- Assistive technology software available

### Test Materials

#### Provided to Participants
- Test scenarios document (accessible format)
- Sample .spv files for upload
- Consent form (accessible PDF/HTML)
- Demographics questionnaire
- SUS questionnaire

#### Facilitator Materials
- Testing protocol script
- Task instruction sheets
- Observation checklist
- Note-taking template
- Recording consent form

---

## Ethical Considerations

### Informed Consent
- Clear explanation of testing purpose
- Right to withdraw at any time
- Data privacy and anonymization
- Recording permissions (audio/video/screen)

### Data Protection
- Anonymize all participant data
- Secure storage of recordings
- Delete data after analysis period
- GDPR/CCPA compliance

### Participant Comfort
- Regular breaks offered
- No time pressure on tasks
- Emphasis on testing the system, not the user
- Encouragement to express frustrations

---

## Facilitator Guidelines

### Before Session
1. Review participant's assistive technology setup
2. Test all sharing/recording software
3. Prepare test files and materials
4. Review testing protocol

### During Session
1. Welcome participant and build rapport
2. Explain think-aloud protocol
3. Read tasks exactly as written
4. Minimize interruptions during tasks
5. Take detailed notes
6. Offer breaks every 20-30 minutes
7. Encourage honest feedback

### After Session
1. Thank participant sincerely
2. Explain next steps
3. Provide compensation promptly
4. Backup recordings and notes
5. Complete facilitator debrief form

---

## Post-Testing Actions

### Immediate (Within 1 Week)
- [ ] Compile all session notes
- [ ] Transcribe key quotes
- [ ] Calculate quantitative metrics
- [ ] Identify critical issues

### Short-Term (Within 2 Weeks)
- [ ] Complete test report
- [ ] Prioritize issue backlog
- [ ] Share findings with development team
- [ ] Schedule remediation sprint

### Long-Term (Within 1 Month)
- [ ] Implement critical fixes
- [ ] Update documentation
- [ ] Schedule re-testing
- [ ] Plan ongoing accessibility monitoring

---

## Success Metrics

### Overall Project Success
- **SUS Score**: ≥68
- **Task Success Rate**: ≥90%
- **Critical Issues**: 0
- **Serious Issues**: <3
- **Participant Satisfaction**: ≥4/5

### WCAG Compliance
- **Level A**: 100% compliance
- **Level AA**: 95% compliance (target 100%)
- **Level AAA**: Stretch goal

### User Feedback
- "I could use this application independently" - 90%+ agree
- "The accessibility features met my needs" - 85%+ agree
- "I would recommend this to others using AT" - 80%+ agree

---

## Continuous Improvement

### Ongoing Monitoring
- Accessibility linting in CI/CD pipeline
- Automated accessibility testing (axe, WAVE)
- Regular manual keyboard testing
- Periodic screen reader spot-checks

### Future Enhancements
- Voice control support
- Switch access optimization
- Internationalization (i18n)
- Additional screen reader testing
- Mobile accessibility testing

---

## Resources

### Internal
- [AccessibilityManager.js](../web/AccessibilityManager.js)
- [VisualShell.js](../web/VisualShell.js)
- [visual_shell.html](../web/visual_shell.html)

### External
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [WebAIM Screen Reader Survey](https://webaim.org/projects/screenreadersurvey/)
- [Accessibility Testing Tools](https://www.w3.org/WAI/ER/tools/)

---

## Contact

**Testing Coordinator**: [Name]
**Email**: [email]
**Accessibility Lead**: [Name]

---

## Appendix A: Consent Form Template

```
Accessibility User Testing Consent Form

I, [Participant Name], agree to participate in accessibility testing for 
Geometry OS Visual Shell.

I understand that:
- The session will last approximately 60-90 minutes
- My screen and voice may be recorded
- My participation is voluntary and I may withdraw at any time
- My data will be anonymized and kept confidential
- I will receive $[amount] compensation for my time

Signature: _________________ Date: _________
```

---

## Appendix B: Demographics Questionnaire

1. Age range: [18-25] [26-35] [36-45] [46-55] [56-65] [65+]
2. Primary assistive technology: ___________
3. Years using assistive technology: ___________
4. Primary web browser: ___________
5. Operating system: ___________
6. Frequency of web use: [Daily] [Weekly] [Monthly]
7. Types of websites used regularly: ___________

---

## Appendix C: SUS Questionnaire

1. I think that I would like to use this system frequently.
2. I found the system unnecessarily complex.
3. I thought the system was easy to use.
4. I think that I would need the support of a technical person to be able to use this system.
5. I found the various functions in this system were well integrated.
6. I thought there was too much inconsistency in this system.
7. I would imagine that most people would learn to use this system very quickly.
8. I found the system very cumbersome to use.
9. I felt very confident using the system.
10. I needed to learn a lot of things before I could get going with this system.

Scale: [1] Strongly Disagree ... [5] Strongly Agree

---

*End of Accessibility User Testing Plan*
