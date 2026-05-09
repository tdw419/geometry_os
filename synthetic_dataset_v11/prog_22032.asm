; DESCRIPTION: Draws a red rectangle at (155, 153) with width 23 and height 96.
; PLAN: r0=155(x), r1=153(y), r2=23(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 153
LDI r2, 23
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
