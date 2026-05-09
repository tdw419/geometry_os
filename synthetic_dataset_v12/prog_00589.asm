; DESCRIPTION: Renders a green disk with center (131, 138) and radius 38.
; PLAN: r0=131(x), r1=138(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 138
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
