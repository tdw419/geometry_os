; DESCRIPTION: Renders a purple disk with center (254, 115) and radius 63.
; PLAN: r0=254(x), r1=115(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 115
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
