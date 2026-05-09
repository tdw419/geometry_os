; DESCRIPTION: Draws a yellow rectangle at (113, 99) with width 58 and height 22.
; PLAN: r0=113(x), r1=99(y), r2=58(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 99
LDI r2, 58
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
