; DESCRIPTION: Draws a orange rectangle at (205, 161) with width 36 and height 85.
; PLAN: r0=205(x), r1=161(y), r2=36(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 161
LDI r2, 36
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
