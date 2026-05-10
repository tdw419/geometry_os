; DESCRIPTION: Draws a yellow rectangle at (98, 14) with width 106 and height 68.
; PLAN: r0=98(x), r1=14(y), r2=106(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 14
LDI r2, 106
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
