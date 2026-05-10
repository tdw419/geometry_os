; DESCRIPTION: Renders a purple disk with center (207, 92) and radius 78.
; PLAN: r0=207(x), r1=92(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 92
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
