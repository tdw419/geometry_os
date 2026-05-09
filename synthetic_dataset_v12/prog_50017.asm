; DESCRIPTION: Draws a orange rectangle at (133, 95) with width 75 and height 13.
; PLAN: r0=133(x), r1=95(y), r2=75(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 75
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
