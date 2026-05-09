; DESCRIPTION: Draws a orange rectangle at (29, 21) with width 100 and height 23.
; PLAN: r0=29(x), r1=21(y), r2=100(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 21
LDI r2, 100
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
