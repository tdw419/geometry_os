; DESCRIPTION: Draws a green rectangle at (142, 66) with width 17 and height 52.
; PLAN: r0=142(x), r1=66(y), r2=17(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 66
LDI r2, 17
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
