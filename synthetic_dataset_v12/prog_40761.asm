; DESCRIPTION: Draws a blue rectangle at (358, 97) with width 63 and height 107.
; PLAN: r0=358(x), r1=97(y), r2=63(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 97
LDI r2, 63
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
