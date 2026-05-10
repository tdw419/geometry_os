; DESCRIPTION: Draws a yellow rectangle at (311, 46) with width 59 and height 106.
; PLAN: r0=311(x), r1=46(y), r2=59(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 46
LDI r2, 59
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
