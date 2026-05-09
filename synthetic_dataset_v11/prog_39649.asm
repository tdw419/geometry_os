; DESCRIPTION: Draws a orange rectangle at (105, 65) with width 99 and height 58.
; PLAN: r0=105(x), r1=65(y), r2=99(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 65
LDI r2, 99
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
