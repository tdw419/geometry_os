; DESCRIPTION: Draws a yellow rectangle at (147, 135) with width 37 and height 96.
; PLAN: r0=147(x), r1=135(y), r2=37(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 135
LDI r2, 37
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
