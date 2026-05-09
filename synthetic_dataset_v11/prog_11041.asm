; DESCRIPTION: Renders a green disk with center (36, 73) and radius 31.
; PLAN: r0=36(x), r1=73(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 73
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
