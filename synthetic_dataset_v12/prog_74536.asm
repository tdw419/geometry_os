; DESCRIPTION: Renders a orange disk with center (382, 36) and radius 19.
; PLAN: r0=382(x), r1=36(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 36
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
