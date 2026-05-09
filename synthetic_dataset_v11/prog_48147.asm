; DESCRIPTION: Draws a blue rectangle at (147, 101) with width 12 and height 42.
; PLAN: r0=147(x), r1=101(y), r2=12(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 101
LDI r2, 12
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
