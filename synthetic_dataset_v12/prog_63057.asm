; DESCRIPTION: Draws a orange rectangle at (145, 160) with width 47 and height 36.
; PLAN: r0=145(x), r1=160(y), r2=47(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 160
LDI r2, 47
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
