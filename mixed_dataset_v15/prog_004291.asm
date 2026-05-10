; DESCRIPTION: Renders a yellow disk with center (117, 131) and radius 31.
; PLAN: r0=117(x), r1=131(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 131
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
