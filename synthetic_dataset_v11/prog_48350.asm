; DESCRIPTION: Draws a blue rectangle at (195, 12) with width 56 and height 89.
; PLAN: r0=195(x), r1=12(y), r2=56(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 12
LDI r2, 56
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
