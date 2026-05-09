; DESCRIPTION: Draws a blue rectangle at (64, 1) with width 60 and height 110.
; PLAN: r0=64(x), r1=1(y), r2=60(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 1
LDI r2, 60
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
