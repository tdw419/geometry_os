; DESCRIPTION: Draws a orange rectangle at (337, 37) with width 36 and height 79.
; PLAN: r0=337(x), r1=37(y), r2=36(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 37
LDI r2, 36
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
