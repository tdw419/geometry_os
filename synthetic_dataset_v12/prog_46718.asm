; DESCRIPTION: Renders a orange disk with center (418, 183) and radius 27.
; PLAN: r0=418(x), r1=183(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 183
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
