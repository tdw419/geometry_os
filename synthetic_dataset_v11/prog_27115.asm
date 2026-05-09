; DESCRIPTION: Draws a magenta rectangle at (70, 147) with width 70 and height 27.
; PLAN: r0=70(x), r1=147(y), r2=70(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 147
LDI r2, 70
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
