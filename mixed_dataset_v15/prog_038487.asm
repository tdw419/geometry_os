; DESCRIPTION: Draws a yellow rectangle at (374, 22) with width 81 and height 35.
; PLAN: r0=374(x), r1=22(y), r2=81(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 22
LDI r2, 81
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
