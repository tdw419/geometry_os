; DESCRIPTION: Draws a orange rectangle at (73, 133) with width 106 and height 29.
; PLAN: r0=73(x), r1=133(y), r2=106(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 133
LDI r2, 106
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
