; DESCRIPTION: Draws a yellow rectangle at (350, 144) with width 97 and height 102.
; PLAN: r0=350(x), r1=144(y), r2=97(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 144
LDI r2, 97
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
