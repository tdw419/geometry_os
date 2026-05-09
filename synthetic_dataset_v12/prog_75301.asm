; DESCRIPTION: Renders a yellow disk with center (61, 188) and radius 60.
; PLAN: r0=61(x), r1=188(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 188
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
