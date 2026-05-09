; DESCRIPTION: Draws a orange rectangle at (335, 40) with width 26 and height 56.
; PLAN: r0=335(x), r1=40(y), r2=26(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 40
LDI r2, 26
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
