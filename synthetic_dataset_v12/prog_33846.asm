; DESCRIPTION: Renders a green disk with center (383, 71) and radius 51.
; PLAN: r0=383(x), r1=71(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 71
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
