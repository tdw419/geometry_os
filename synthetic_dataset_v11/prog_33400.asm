; DESCRIPTION: Renders a orange disk with center (166, 177) and radius 26.
; PLAN: r0=166(x), r1=177(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 177
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
