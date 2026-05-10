; DESCRIPTION: Draws a magenta rectangle at (147, 151) with width 82 and height 15.
; PLAN: r0=147(x), r1=151(y), r2=82(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 151
LDI r2, 82
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
