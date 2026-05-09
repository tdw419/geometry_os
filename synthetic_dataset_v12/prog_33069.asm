; DESCRIPTION: Draws a orange rectangle at (147, 111) with width 56 and height 99.
; PLAN: r0=147(x), r1=111(y), r2=56(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 111
LDI r2, 56
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
