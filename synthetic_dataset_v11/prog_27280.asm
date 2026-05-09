; DESCRIPTION: Renders a green disk with center (141, 94) and radius 36.
; PLAN: r0=141(x), r1=94(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 94
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
