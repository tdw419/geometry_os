; DESCRIPTION: Draws a black rectangle at (166, 144) with width 11 and height 22.
; PLAN: r0=166(x), r1=144(y), r2=11(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 144
LDI r2, 11
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
