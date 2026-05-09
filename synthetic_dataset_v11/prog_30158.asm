; DESCRIPTION: Renders a green disk with center (73, 183) and radius 59.
; PLAN: r0=73(x), r1=183(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 183
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
