; DESCRIPTION: Draws a orange rectangle at (147, 60) with width 37 and height 40.
; PLAN: r0=147(x), r1=60(y), r2=37(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 60
LDI r2, 37
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
