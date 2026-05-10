; DESCRIPTION: Draws a orange rectangle at (345, 110) with width 91 and height 16.
; PLAN: r0=345(x), r1=110(y), r2=91(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 110
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
