; DESCRIPTION: Renders a white disk with center (423, 132) and radius 46.
; PLAN: r0=423(x), r1=132(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 132
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
