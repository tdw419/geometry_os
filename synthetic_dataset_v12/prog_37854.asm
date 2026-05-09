; DESCRIPTION: Draws a orange rectangle at (279, 99) with width 82 and height 23.
; PLAN: r0=279(x), r1=99(y), r2=82(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 99
LDI r2, 82
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
