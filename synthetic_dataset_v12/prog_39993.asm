; DESCRIPTION: Draws a orange rectangle at (6, 105) with width 30 and height 60.
; PLAN: r0=6(x), r1=105(y), r2=30(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 105
LDI r2, 30
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
