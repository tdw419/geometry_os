; DESCRIPTION: Draws a yellow rectangle at (63, 22) with width 92 and height 115.
; PLAN: r0=63(x), r1=22(y), r2=92(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 22
LDI r2, 92
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
