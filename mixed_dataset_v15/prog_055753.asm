; DESCRIPTION: Renders a green disk with center (94, 89) and radius 52.
; PLAN: r0=94(x), r1=89(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 89
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
