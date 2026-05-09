; DESCRIPTION: Renders a yellow disk with center (360, 120) and radius 53.
; PLAN: r0=360(x), r1=120(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 120
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
