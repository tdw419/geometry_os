; DESCRIPTION: Draws a orange rectangle at (359, 207) with width 63 and height 18.
; PLAN: r0=359(x), r1=207(y), r2=63(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 207
LDI r2, 63
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
