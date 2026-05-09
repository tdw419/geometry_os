; DESCRIPTION: Draws a black rectangle at (144, 37) with width 106 and height 68.
; PLAN: r0=144(x), r1=37(y), r2=106(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 37
LDI r2, 106
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
