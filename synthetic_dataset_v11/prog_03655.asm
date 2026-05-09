; DESCRIPTION: Draws a yellow rectangle at (161, 46) with width 81 and height 97.
; PLAN: r0=161(x), r1=46(y), r2=81(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 46
LDI r2, 81
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
