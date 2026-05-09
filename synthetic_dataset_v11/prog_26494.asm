; DESCRIPTION: Renders a orange disk with center (36, 97) and radius 31.
; PLAN: r0=36(x), r1=97(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 97
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
