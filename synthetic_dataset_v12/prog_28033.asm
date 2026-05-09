; DESCRIPTION: Draws a orange rectangle at (91, 216) with width 12 and height 12.
; PLAN: r0=91(x), r1=216(y), r2=12(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 216
LDI r2, 12
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
