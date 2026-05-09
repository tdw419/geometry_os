; DESCRIPTION: Renders a orange disk with center (343, 196) and radius 20.
; PLAN: r0=343(x), r1=196(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 196
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
