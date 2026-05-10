; DESCRIPTION: Draws a green rectangle at (374, 137) with width 99 and height 22.
; PLAN: r0=374(x), r1=137(y), r2=99(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 137
LDI r2, 99
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
