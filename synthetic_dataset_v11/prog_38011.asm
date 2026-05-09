; DESCRIPTION: Draws a magenta rectangle at (135, 147) with width 29 and height 58.
; PLAN: r0=135(x), r1=147(y), r2=29(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 147
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
