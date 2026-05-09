; DESCRIPTION: Draws a orange rectangle at (13, 157) with width 83 and height 78.
; PLAN: r0=13(x), r1=157(y), r2=83(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 157
LDI r2, 83
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
