; DESCRIPTION: Draws a blue rectangle at (105, 192) with width 101 and height 60.
; PLAN: r0=105(x), r1=192(y), r2=101(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 192
LDI r2, 101
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
