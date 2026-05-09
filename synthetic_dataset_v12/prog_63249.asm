; DESCRIPTION: Draws a orange rectangle at (364, 16) with width 97 and height 91.
; PLAN: r0=364(x), r1=16(y), r2=97(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 16
LDI r2, 97
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
