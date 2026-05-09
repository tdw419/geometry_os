; DESCRIPTION: Renders a purple disk with center (217, 184) and radius 27.
; PLAN: r0=217(x), r1=184(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 184
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
