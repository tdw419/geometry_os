; DESCRIPTION: Draws a orange rectangle at (88, 92) with width 118 and height 86.
; PLAN: r0=88(x), r1=92(y), r2=118(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 92
LDI r2, 118
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
