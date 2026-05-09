; DESCRIPTION: Draws a green rectangle at (384, 97) with width 96 and height 51.
; PLAN: r0=384(x), r1=97(y), r2=96(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 97
LDI r2, 96
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
