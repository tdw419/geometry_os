; DESCRIPTION: Draws a yellow rectangle at (115, 187) with width 106 and height 21.
; PLAN: r0=115(x), r1=187(y), r2=106(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 187
LDI r2, 106
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
