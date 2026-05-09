; DESCRIPTION: Draws a orange rectangle at (5, 99) with width 78 and height 61.
; PLAN: r0=5(x), r1=99(y), r2=78(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 99
LDI r2, 78
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
