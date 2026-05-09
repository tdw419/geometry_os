; DESCRIPTION: Draws a yellow rectangle at (330, 99) with width 26 and height 115.
; PLAN: r0=330(x), r1=99(y), r2=26(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 99
LDI r2, 26
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
