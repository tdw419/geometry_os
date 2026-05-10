; DESCRIPTION: Draws a red rectangle at (324, 102) with width 101 and height 114.
; PLAN: r0=324(x), r1=102(y), r2=101(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 102
LDI r2, 101
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
