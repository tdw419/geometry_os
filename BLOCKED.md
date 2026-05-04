# Auto-generated: blocked phases requiring manual intervention
# Refreshed: 2026-05-04 17:35 CDT by geo-watchdog
# NOTE: BLOCKED_MAX_AGE is 1h -- this file needs periodic refresh.
#
# phase-206: Drafter failed 4x on unaligned virtio structure reads.
# The read_word_fn API reads u32-aligned words but virtio mixes u16/u32
# fields. Needs API design decision (add read_half_word_fn or pack test data
# as u32-aligned). Drafter cannot resolve this autonomously.
#
phase-206 | drafter failed 4x, unaligned virtio reads need manual API fix | 1777905350 | 1
