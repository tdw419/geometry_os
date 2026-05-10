; DESCRIPTION: Draws a yellow rectangle at (307, 25) with width 118 and height 99.
; PLAN: r0=307(x), r1=25(y), r2=118(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 25
LDI r2, 118
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
