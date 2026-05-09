; DESCRIPTION: Draws a magenta rectangle at (0, 147) with width 47 and height 102.
; PLAN: r0=0(x), r1=147(y), r2=47(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 147
LDI r2, 47
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
