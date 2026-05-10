; DESCRIPTION: Renders a red circular shape at (216, 131) with radius 80.
; PLAN: r0=216(x), r1=131(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 131
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
