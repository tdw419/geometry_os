; DESCRIPTION: Draws a black rectangle at (426, 52) with width 65 and height 117.
; PLAN: r0=426(x), r1=52(y), r2=65(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 52
LDI r2, 65
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
