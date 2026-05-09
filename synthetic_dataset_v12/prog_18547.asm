; DESCRIPTION: Renders a orange disk with center (263, 137) and radius 43.
; PLAN: r0=263(x), r1=137(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 137
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
