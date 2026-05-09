; DESCRIPTION: Composite: . Then Places a orange dot at position (109, 87). Then Renders a yellow disk with center (106, 137) and radius 34.
; PLAN: r0=109(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=106(x), r1=137(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (109, 87).
; PLAN: r0=109(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (106, 137) and radius 34.
; PLAN: r0=106(x), r1=137(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 137
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
