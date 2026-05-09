; DESCRIPTION: Draws a orange rectangle at (282, 145) with width 36 and height 34.
; PLAN: r0=282(x), r1=145(y), r2=36(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 145
LDI r2, 36
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
