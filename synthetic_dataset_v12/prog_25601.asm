; DESCRIPTION: Draws a magenta rectangle at (49, 137) with width 33 and height 14.
; PLAN: r0=49(x), r1=137(y), r2=33(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 137
LDI r2, 33
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
