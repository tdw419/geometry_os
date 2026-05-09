; DESCRIPTION: Draws a yellow rectangle at (7, 166) with width 106 and height 76.
; PLAN: r0=7(x), r1=166(y), r2=106(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 166
LDI r2, 106
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
