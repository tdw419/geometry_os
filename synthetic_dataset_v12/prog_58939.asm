; DESCRIPTION: Renders a orange disk with center (77, 103) and radius 61.
; PLAN: r0=77(x), r1=103(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 103
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
