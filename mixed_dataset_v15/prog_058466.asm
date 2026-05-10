; DESCRIPTION: Draws a yellow rectangle at (19, 137) with width 21 and height 78.
; PLAN: r0=19(x), r1=137(y), r2=21(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 137
LDI r2, 21
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
