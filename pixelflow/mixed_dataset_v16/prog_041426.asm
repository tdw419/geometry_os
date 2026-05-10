; DESCRIPTION: Draws a yellow rectangle at (44, 4) with width 43 and height 68.
; PLAN: r0=44(x), r1=4(y), r2=43(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 4
LDI r2, 43
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
