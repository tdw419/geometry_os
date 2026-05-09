; DESCRIPTION: Renders a purple disk with center (182, 181) and radius 56.
; PLAN: r0=182(x), r1=181(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 181
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
