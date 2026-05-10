; DESCRIPTION: Draws a yellow rectangle at (98, 106) with width 98 and height 94.
; PLAN: r0=98(x), r1=106(y), r2=98(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 106
LDI r2, 98
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
