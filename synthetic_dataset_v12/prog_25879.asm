; DESCRIPTION: Renders a purple disk with center (376, 161) and radius 13.
; PLAN: r0=376(x), r1=161(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 161
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
