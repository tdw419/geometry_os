; DESCRIPTION: Renders a red disk with center (36, 153) and radius 20.
; PLAN: r0=36(x), r1=153(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 153
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
