; DESCRIPTION: Draws a orange rectangle at (223, 85) with width 49 and height 22.
; PLAN: r0=223(x), r1=85(y), r2=49(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 85
LDI r2, 49
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
