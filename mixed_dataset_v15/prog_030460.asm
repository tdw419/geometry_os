; DESCRIPTION: Draws a magenta rectangle at (38, 147) with width 93 and height 26.
; PLAN: r0=38(x), r1=147(y), r2=93(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 147
LDI r2, 93
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
