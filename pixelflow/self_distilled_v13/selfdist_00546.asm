; DESCRIPTION: Renders a yellow rectangular region spanning 47 by 79 at (376, 155).
; PLAN: r0=376(x), r1=155(y), r2=47(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 155
LDI r2, 47
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
