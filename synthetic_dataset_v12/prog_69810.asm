; DESCRIPTION: Places a red 24x67 rectangle at position (368, 51).
; PLAN: r0=368(x), r1=51(y), r2=24(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 51
LDI r2, 24
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
