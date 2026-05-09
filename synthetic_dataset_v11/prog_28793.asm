; DESCRIPTION: Draws a red rectangle at (162, 19) with width 83 and height 114.
; PLAN: r0=162(x), r1=19(y), r2=83(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 19
LDI r2, 83
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
