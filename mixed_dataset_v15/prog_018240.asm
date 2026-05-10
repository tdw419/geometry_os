; DESCRIPTION: Draws a blue rectangle at (112, 137) with width 92 and height 115.
; PLAN: r0=112(x), r1=137(y), r2=92(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 137
LDI r2, 92
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
