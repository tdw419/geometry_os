; DESCRIPTION: Draws a yellow rectangle at (389, 118) with width 27 and height 46.
; PLAN: r0=389(x), r1=118(y), r2=27(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 118
LDI r2, 27
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
