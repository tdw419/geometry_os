; DESCRIPTION: Draws a yellow rectangle at (110, 115) with width 17 and height 21.
; PLAN: r0=110(x), r1=115(y), r2=17(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 115
LDI r2, 17
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
