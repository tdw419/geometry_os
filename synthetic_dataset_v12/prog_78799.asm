; DESCRIPTION: Renders a red disk with center (369, 100) and radius 36.
; PLAN: r0=369(x), r1=100(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 100
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
