; DESCRIPTION: Draws a black rectangle at (86, 84) with width 52 and height 71.
; PLAN: r0=86(x), r1=84(y), r2=52(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 84
LDI r2, 52
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
