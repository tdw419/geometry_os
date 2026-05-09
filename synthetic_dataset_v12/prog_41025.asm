; DESCRIPTION: Draws a orange rectangle at (364, 37) with width 54 and height 109.
; PLAN: r0=364(x), r1=37(y), r2=54(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 37
LDI r2, 54
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
