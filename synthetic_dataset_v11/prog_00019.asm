; DESCRIPTION: Draws a blue rectangle at (32, 110) with width 66 and height 44.
; PLAN: r0=32(x), r1=110(y), r2=66(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 110
LDI r2, 66
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
