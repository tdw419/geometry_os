; DESCRIPTION: Draws a orange rectangle at (145, 67) with width 71 and height 110.
; PLAN: r0=145(x), r1=67(y), r2=71(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 67
LDI r2, 71
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
