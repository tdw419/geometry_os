; DESCRIPTION: Draws a orange rectangle at (49, 115) with width 34 and height 90.
; PLAN: r0=49(x), r1=115(y), r2=34(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 115
LDI r2, 34
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
