; DESCRIPTION: Renders a orange disk with center (112, 132) and radius 46.
; PLAN: r0=112(x), r1=132(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 132
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
