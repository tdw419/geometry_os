; DESCRIPTION: Draws a orange rectangle at (157, 106) with width 30 and height 84.
; PLAN: r0=157(x), r1=106(y), r2=30(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 106
LDI r2, 30
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
