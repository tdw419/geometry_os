; DESCRIPTION: Renders a orange disk with center (91, 169) and radius 77.
; PLAN: r0=91(x), r1=169(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 169
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
