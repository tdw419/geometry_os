; DESCRIPTION: Renders a purple disk with center (469, 46) and radius 36.
; PLAN: r0=469(x), r1=46(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 46
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
