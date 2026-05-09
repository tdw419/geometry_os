; DESCRIPTION: Draws a blue rectangle at (119, 118) with width 111 and height 101.
; PLAN: r0=119(x), r1=118(y), r2=111(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 118
LDI r2, 111
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
