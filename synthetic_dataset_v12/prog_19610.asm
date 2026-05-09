; DESCRIPTION: Draws a yellow rectangle at (223, 29) with width 115 and height 97.
; PLAN: r0=223(x), r1=29(y), r2=115(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 29
LDI r2, 115
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
