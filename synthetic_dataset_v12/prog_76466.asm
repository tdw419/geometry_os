; DESCRIPTION: Draws a orange rectangle at (233, 99) with width 59 and height 43.
; PLAN: r0=233(x), r1=99(y), r2=59(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 99
LDI r2, 59
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
