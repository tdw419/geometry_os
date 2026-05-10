; DESCRIPTION: Draws a orange rectangle at (363, 160) with width 22 and height 53.
; PLAN: r0=363(x), r1=160(y), r2=22(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 160
LDI r2, 22
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
