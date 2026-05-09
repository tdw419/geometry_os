; DESCRIPTION: Draws a blue rectangle at (185, 144) with width 64 and height 14.
; PLAN: r0=185(x), r1=144(y), r2=64(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 144
LDI r2, 64
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
