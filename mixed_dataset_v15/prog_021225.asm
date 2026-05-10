; DESCRIPTION: Draws a orange rectangle at (130, 14) with width 119 and height 47.
; PLAN: r0=130(x), r1=14(y), r2=119(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 14
LDI r2, 119
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
