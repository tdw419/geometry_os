; DESCRIPTION: Draws a black rectangle at (44, 136) with width 80 and height 86.
; PLAN: r0=44(x), r1=136(y), r2=80(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 136
LDI r2, 80
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
