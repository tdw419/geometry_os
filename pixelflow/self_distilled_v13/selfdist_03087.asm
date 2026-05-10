; DESCRIPTION: Renders a purple rectangular region spanning 53 by 105 at (314, 155).
; PLAN: r0=314(x), r1=155(y), r2=53(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 155
LDI r2, 53
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
