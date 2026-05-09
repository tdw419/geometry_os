; DESCRIPTION: Renders a green disk with center (138, 45) and radius 36.
; PLAN: r0=138(x), r1=45(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 45
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
