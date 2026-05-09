; DESCRIPTION: Draws a blue rectangle at (0, 58) with width 119 and height 101.
; PLAN: r0=0(x), r1=58(y), r2=119(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 58
LDI r2, 119
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
