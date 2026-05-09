; DESCRIPTION: Draws a orange rectangle at (172, 92) with width 88 and height 40.
; PLAN: r0=172(x), r1=92(y), r2=88(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 92
LDI r2, 88
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
