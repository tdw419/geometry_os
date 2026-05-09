; DESCRIPTION: Draws a orange rectangle at (11, 90) with width 90 and height 20.
; PLAN: r0=11(x), r1=90(y), r2=90(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 90
LDI r2, 90
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
