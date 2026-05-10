; DESCRIPTION: Draws a blue rectangle at (249, 101) with width 81 and height 55.
; PLAN: r0=249(x), r1=101(y), r2=81(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 101
LDI r2, 81
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
