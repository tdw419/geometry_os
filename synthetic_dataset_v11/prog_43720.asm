; DESCRIPTION: Draws a red rectangle at (226, 64) with width 14 and height 101.
; PLAN: r0=226(x), r1=64(y), r2=14(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 64
LDI r2, 14
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
