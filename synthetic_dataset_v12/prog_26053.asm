; DESCRIPTION: Renders a purple disk with center (61, 75) and radius 43.
; PLAN: r0=61(x), r1=75(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 75
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
