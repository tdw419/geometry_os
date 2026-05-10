; DESCRIPTION: Renders a purple disk with center (464, 112) and radius 31.
; PLAN: r0=464(x), r1=112(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 112
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
