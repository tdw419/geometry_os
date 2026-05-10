; DESCRIPTION: Renders a magenta rectangular region spanning 15 by 91 at (137, 155).
; PLAN: r0=137(x), r1=155(y), r2=15(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 155
LDI r2, 15
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
