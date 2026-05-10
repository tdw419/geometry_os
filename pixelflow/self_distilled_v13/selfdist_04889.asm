; DESCRIPTION: Draws a orange rectangle at (8, 119) with width 44 and height 86.
; PLAN: r0=8(x), r1=119(y), r2=44(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 119
LDI r2, 44
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
