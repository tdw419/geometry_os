; DESCRIPTION: Draws a orange rectangle at (45, 29) with width 118 and height 17.
; PLAN: r0=45(x), r1=29(y), r2=118(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 29
LDI r2, 118
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
