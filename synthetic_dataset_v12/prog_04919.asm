; DESCRIPTION: Renders a green disk with center (238, 145) and radius 60.
; PLAN: r0=238(x), r1=145(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 145
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
