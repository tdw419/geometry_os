; DESCRIPTION: Renders a yellow disk with center (403, 183) and radius 60.
; PLAN: r0=403(x), r1=183(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 183
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
