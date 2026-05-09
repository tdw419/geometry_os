; DESCRIPTION: Draws a orange rectangle at (408, 145) with width 99 and height 39.
; PLAN: r0=408(x), r1=145(y), r2=99(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 145
LDI r2, 99
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
