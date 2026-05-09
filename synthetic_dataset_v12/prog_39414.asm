; DESCRIPTION: Renders a yellow disk with center (168, 89) and radius 55.
; PLAN: r0=168(x), r1=89(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 89
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
