; DESCRIPTION: Draws a blue rectangle at (97, 49) with width 60 and height 87.
; PLAN: r0=97(x), r1=49(y), r2=60(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 49
LDI r2, 60
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
