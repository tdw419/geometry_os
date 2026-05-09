; DESCRIPTION: Draws a yellow rectangle at (266, 6) with width 109 and height 26.
; PLAN: r0=266(x), r1=6(y), r2=109(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 6
LDI r2, 109
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
