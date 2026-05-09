; DESCRIPTION: Draws a blue rectangle at (40, 11) with width 118 and height 55.
; PLAN: r0=40(x), r1=11(y), r2=118(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 11
LDI r2, 118
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
