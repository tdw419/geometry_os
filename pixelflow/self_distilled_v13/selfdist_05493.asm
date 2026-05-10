; DESCRIPTION: Draws a orange rectangle at (106, 12) with width 22 and height 50.
; PLAN: r0=106(x), r1=12(y), r2=22(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 12
LDI r2, 22
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
