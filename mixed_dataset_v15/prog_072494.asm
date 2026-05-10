; DESCRIPTION: Renders a purple rectangular region spanning 57 by 108 at (376, 104).
; PLAN: r0=376(x), r1=104(y), r2=57(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 104
LDI r2, 57
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
