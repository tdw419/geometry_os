; DESCRIPTION: Draws a orange rectangle at (336, 23) with width 51 and height 67.
; PLAN: r0=336(x), r1=23(y), r2=51(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 23
LDI r2, 51
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
