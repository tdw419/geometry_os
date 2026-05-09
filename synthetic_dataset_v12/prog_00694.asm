; DESCRIPTION: Renders a yellow disk with center (403, 120) and radius 38.
; PLAN: r0=403(x), r1=120(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 120
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
