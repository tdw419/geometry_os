; DESCRIPTION: Draws a orange rectangle at (147, 62) with width 83 and height 69.
; PLAN: r0=147(x), r1=62(y), r2=83(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 62
LDI r2, 83
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
