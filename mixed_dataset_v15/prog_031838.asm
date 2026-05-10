; DESCRIPTION: Renders a green disk with center (435, 94) and radius 51.
; PLAN: r0=435(x), r1=94(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 94
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
