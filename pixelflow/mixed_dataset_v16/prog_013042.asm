; DESCRIPTION: Draws a blue rectangle at (219, 195) with width 94 and height 83.
; PLAN: r0=219(x), r1=195(y), r2=94(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 195
LDI r2, 94
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
