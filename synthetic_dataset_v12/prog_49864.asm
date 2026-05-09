; DESCRIPTION: Draws a black rectangle at (52, 13) with width 115 and height 84.
; PLAN: r0=52(x), r1=13(y), r2=115(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 13
LDI r2, 115
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
