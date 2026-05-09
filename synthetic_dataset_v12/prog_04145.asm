; DESCRIPTION: Draws a blue rectangle at (163, 10) with width 58 and height 37.
; PLAN: r0=163(x), r1=10(y), r2=58(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 10
LDI r2, 58
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
