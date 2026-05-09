; DESCRIPTION: Renders a yellow disk with center (131, 146) and radius 55.
; PLAN: r0=131(x), r1=146(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 146
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
