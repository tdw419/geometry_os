; DESCRIPTION: Draws a orange rectangle at (205, 116) with width 14 and height 118.
; PLAN: r0=205(x), r1=116(y), r2=14(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 116
LDI r2, 14
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
