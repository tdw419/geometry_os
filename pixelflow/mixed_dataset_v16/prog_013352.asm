; DESCRIPTION: Renders a purple disk with center (267, 188) and radius 31.
; PLAN: r0=267(x), r1=188(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 188
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
