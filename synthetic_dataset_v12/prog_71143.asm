; DESCRIPTION: Draws a orange rectangle at (221, 108) with width 18 and height 118.
; PLAN: r0=221(x), r1=108(y), r2=18(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 108
LDI r2, 18
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
