; DESCRIPTION: Draws a orange rectangle at (29, 118) with width 14 and height 46.
; PLAN: r0=29(x), r1=118(y), r2=14(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 14
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
