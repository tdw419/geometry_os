; DESCRIPTION: Draws a orange rectangle at (96, 216) with width 17 and height 29.
; PLAN: r0=96(x), r1=216(y), r2=17(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 216
LDI r2, 17
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
