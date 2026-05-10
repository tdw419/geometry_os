; DESCRIPTION: Draws a orange rectangle at (244, 179) with width 10 and height 37.
; PLAN: r0=244(x), r1=179(y), r2=10(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 179
LDI r2, 10
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
