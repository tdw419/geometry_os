; DESCRIPTION: Renders a yellow disk with center (273, 171) and radius 64.
; PLAN: r0=273(x), r1=171(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 171
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
