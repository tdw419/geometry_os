; DESCRIPTION: Renders a purple disk with center (401, 112) and radius 43.
; PLAN: r0=401(x), r1=112(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 112
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
