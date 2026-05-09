; DESCRIPTION: Draws a orange rectangle at (219, 87) with width 90 and height 117.
; PLAN: r0=219(x), r1=87(y), r2=90(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 87
LDI r2, 90
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
