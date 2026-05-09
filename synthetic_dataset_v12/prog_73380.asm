; DESCRIPTION: Draws a yellow rectangle at (297, 46) with width 119 and height 98.
; PLAN: r0=297(x), r1=46(y), r2=119(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 46
LDI r2, 119
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
