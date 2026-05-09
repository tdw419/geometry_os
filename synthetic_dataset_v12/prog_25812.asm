; DESCRIPTION: Draws a blue rectangle at (195, 60) with width 17 and height 49.
; PLAN: r0=195(x), r1=60(y), r2=17(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 60
LDI r2, 17
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
