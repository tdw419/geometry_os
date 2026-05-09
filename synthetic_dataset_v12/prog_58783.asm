; DESCRIPTION: Draws a orange rectangle at (2, 174) with width 21 and height 44.
; PLAN: r0=2(x), r1=174(y), r2=21(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 174
LDI r2, 21
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
