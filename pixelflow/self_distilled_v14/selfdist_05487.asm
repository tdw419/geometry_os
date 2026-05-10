; DESCRIPTION: Draws a orange rectangle at (219, 169) with width 74 and height 12.
; PLAN: r0=219(x), r1=169(y), r2=74(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 169
LDI r2, 74
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
