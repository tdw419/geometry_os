; DESCRIPTION: Draws a orange rectangle at (433, 91) with width 66 and height 83.
; PLAN: r0=433(x), r1=91(y), r2=66(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 91
LDI r2, 66
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
