# Native Glyph Shell Training Materials

This directory contains comprehensive training materials for the Native Glyph Shell (G-Shell).

## Contents

| File | Description | Audience |
|------|-------------|----------|
| `NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md` | Full training program with 7 modules | New users |
| `GLYPH_SHELL_QUICK_REFERENCE.md` | Quick reference card | All users |

## Getting Started

### For New Users

1. **Read the Training Program**
   ```bash
   cat docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md
   # Or open in your preferred markdown viewer
   ```

2. **Take the Interactive Tutorial**
   ```bash
   python3 scripts/glyph_shell_tutorial.py
   ```

3. **Keep the Quick Reference Handy**
   ```bash
   cat docs/training/GLYPH_SHELL_QUICK_REFERENCE.md
   ```

4. **Provide Feedback**
   ```bash
   python3 scripts/training_feedback_survey.py
   ```

### For Instructors

The training program is designed for both self-paced learning and instructor-led sessions:

- **Self-Paced**: Users complete modules at their own speed
- **Instructor-Led**: Use the modules as lesson plans

## Training Modules

| Module | Topic | Duration |
|--------|-------|----------|
| 1 | Getting Started | 15 min |
| 2 | Keyboard Navigation | 20 min |
| 3 | Geometry OS Commands | 30 min |
| 4 | AI Context Injection | 25 min |
| 5 | GNB State Synchronization | 20 min |
| 6 | Advanced Features | 30 min |
| 7 | Troubleshooting | 15 min |

**Total Duration**: ~2.5 hours

## Interactive Tutorial

The interactive tutorial (`scripts/glyph_shell_tutorial.py`) provides hands-on practice:

```bash
# Start from beginning
python3 scripts/glyph_shell_tutorial.py

# Start at specific module
python3 scripts/glyph_shell_tutorial.py --module 3

# Practice mode (no scoring)
python3 scripts/glyph_shell_tutorial.py --practice

# Skip introduction
python3 scripts/glyph_shell_tutorial.py --skip-intro
```

## Feedback System

Collect and analyze user feedback:

```bash
# Take the survey
python3 scripts/training_feedback_survey.py

# Generate summary report
python3 scripts/training_feedback_survey.py --report

# Export to CSV
python3 scripts/training_feedback_survey.py --export
```

## Completion Certificate

After completing the training:

```bash
python3 scripts/generate_training_certificate.py --user "$USER" --completed
```

## Prerequisites

Before starting the training, ensure:

- [ ] Python 3.10+ installed
- [ ] Geometry OS repository cloned
- [ ] Terminal access
- [ ] (Optional) Gemini CLI installed for AI features
- [ ] (Optional) Claude CLI installed for AI features

## Learning Objectives

After completing this training, users will be able to:

1. Navigate the G-Shell interface using keyboard shortcuts
2. Use the visual command palette for quick actions
3. Execute Geometry OS commands (`g` prefix)
4. Leverage AI context injection with `gemini` and `claude` commands
5. Understand the Geometric Neural Buffer (GNB) state synchronization
6. Troubleshoot common issues

## Support

- **In-shell help**: Press `?` or type `g help`
- **Documentation**: `docs/` directory
- **Community**: Discord `discord.gg/geometry-os`
- **Issues**: GitHub Issues

## Contributing

To improve the training materials:

1. Take the training and provide feedback
2. Submit issues for unclear content
3. Propose new exercises via pull requests
4. Share your experience with the community

---

*Last Updated: 2026-03-11*
