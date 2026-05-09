; DESCRIPTION: Renders a purple disk with center (214, 133) and radius 18.
; PLAN: r0=214(x), r1=133(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 133
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
