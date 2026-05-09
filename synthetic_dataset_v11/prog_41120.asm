; DESCRIPTION: Draws a orange rectangle at (232, 16) with width 12 and height 78.
; PLAN: r0=232(x), r1=16(y), r2=12(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 16
LDI r2, 12
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
