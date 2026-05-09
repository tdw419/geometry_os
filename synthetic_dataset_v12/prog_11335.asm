; DESCRIPTION: Draws a green rectangle at (57, 136) with width 96 and height 40.
; PLAN: r0=57(x), r1=136(y), r2=96(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 136
LDI r2, 96
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
