; DESCRIPTION: Draws a orange rectangle at (105, 21) with width 90 and height 44.
; PLAN: r0=105(x), r1=21(y), r2=90(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 21
LDI r2, 90
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
