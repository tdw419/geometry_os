; DESCRIPTION: Renders a orange disk with center (131, 80) and radius 52.
; PLAN: r0=131(x), r1=80(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 80
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
