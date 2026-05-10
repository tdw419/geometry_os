; DESCRIPTION: Renders a blue rectangular region spanning 15 by 47 at (314, 29).
; PLAN: r0=314(x), r1=29(y), r2=15(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 29
LDI r2, 15
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
