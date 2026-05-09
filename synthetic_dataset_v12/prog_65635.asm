; DESCRIPTION: Draws a yellow rectangle at (147, 224) with width 106 and height 32.
; PLAN: r0=147(x), r1=224(y), r2=106(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 224
LDI r2, 106
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
