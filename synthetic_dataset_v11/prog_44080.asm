; DESCRIPTION: Draws a orange rectangle at (222, 23) with width 29 and height 79.
; PLAN: r0=222(x), r1=23(y), r2=29(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 23
LDI r2, 29
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
