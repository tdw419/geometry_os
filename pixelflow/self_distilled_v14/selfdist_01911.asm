; DESCRIPTION: Draws a orange rectangle at (170, 147) with width 56 and height 108.
; PLAN: r0=170(x), r1=147(y), r2=56(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 147
LDI r2, 56
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
