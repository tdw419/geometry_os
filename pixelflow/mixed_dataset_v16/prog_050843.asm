; DESCRIPTION: Draws a green rectangle at (32, 155) with width 96 and height 25.
; PLAN: r0=32(x), r1=155(y), r2=96(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 155
LDI r2, 96
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
