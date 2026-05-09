; DESCRIPTION: Draws a orange rectangle at (14, 7) with width 29 and height 110.
; PLAN: r0=14(x), r1=7(y), r2=29(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 7
LDI r2, 29
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
