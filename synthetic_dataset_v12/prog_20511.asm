; DESCRIPTION: Renders a red disk with center (355, 131) and radius 77.
; PLAN: r0=355(x), r1=131(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 131
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
