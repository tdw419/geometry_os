; DESCRIPTION: Draws a blue rectangle at (350, 96) with width 62 and height 105.
; PLAN: r0=350(x), r1=96(y), r2=62(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 96
LDI r2, 62
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
