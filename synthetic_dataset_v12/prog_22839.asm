; DESCRIPTION: Draws a orange rectangle at (250, 161) with width 31 and height 68.
; PLAN: r0=250(x), r1=161(y), r2=31(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 161
LDI r2, 31
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
