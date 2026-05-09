; DESCRIPTION: Renders a orange disk with center (293, 220) and radius 34.
; PLAN: r0=293(x), r1=220(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 220
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
