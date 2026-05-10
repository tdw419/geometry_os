; DESCRIPTION: Draws a orange rectangle at (495, 147) with width 10 and height 99.
; PLAN: r0=495(x), r1=147(y), r2=10(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 147
LDI r2, 10
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
