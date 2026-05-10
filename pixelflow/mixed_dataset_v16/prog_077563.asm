; DESCRIPTION: Draws a orange rectangle at (478, 144) with width 34 and height 29.
; PLAN: r0=478(x), r1=144(y), r2=34(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 144
LDI r2, 34
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
