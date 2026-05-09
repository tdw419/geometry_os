; DESCRIPTION: Places a red 19x92 rectangle at position (155, 42).
; PLAN: r0=155(x), r1=42(y), r2=19(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 42
LDI r2, 19
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
