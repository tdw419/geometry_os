; DESCRIPTION: Draws a orange rectangle at (379, 91) with width 15 and height 31.
; PLAN: r0=379(x), r1=91(y), r2=15(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 91
LDI r2, 15
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
