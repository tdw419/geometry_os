; DESCRIPTION: Draws a orange rectangle at (14, 132) with width 91 and height 66.
; PLAN: r0=14(x), r1=132(y), r2=91(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 132
LDI r2, 91
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
