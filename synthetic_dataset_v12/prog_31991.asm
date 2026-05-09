; DESCRIPTION: Draws a blue rectangle at (13, 195) with width 89 and height 49.
; PLAN: r0=13(x), r1=195(y), r2=89(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 195
LDI r2, 89
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
