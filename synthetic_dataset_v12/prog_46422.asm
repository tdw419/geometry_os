; DESCRIPTION: Draws a red rectangle at (100, 226) with width 81 and height 22.
; PLAN: r0=100(x), r1=226(y), r2=81(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 226
LDI r2, 81
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
