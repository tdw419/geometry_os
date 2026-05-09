; DESCRIPTION: Renders a green disk with center (249, 89) and radius 19.
; PLAN: r0=249(x), r1=89(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 89
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
