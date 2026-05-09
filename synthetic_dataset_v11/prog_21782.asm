; DESCRIPTION: Draws a magenta rectangle at (150, 147) with width 28 and height 38.
; PLAN: r0=150(x), r1=147(y), r2=28(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 147
LDI r2, 28
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
