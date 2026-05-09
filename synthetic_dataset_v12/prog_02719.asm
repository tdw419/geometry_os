; DESCRIPTION: Draws a yellow rectangle at (406, 106) with width 71 and height 112.
; PLAN: r0=406(x), r1=106(y), r2=71(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 106
LDI r2, 71
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
