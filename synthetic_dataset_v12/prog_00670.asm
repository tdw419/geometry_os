; DESCRIPTION: Renders a purple disk with center (267, 193) and radius 47.
; PLAN: r0=267(x), r1=193(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 193
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
