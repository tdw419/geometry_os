; DESCRIPTION: Draws a orange rectangle at (409, 10) with width 70 and height 81.
; PLAN: r0=409(x), r1=10(y), r2=70(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 10
LDI r2, 70
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
