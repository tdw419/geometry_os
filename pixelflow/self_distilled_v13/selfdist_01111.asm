; DESCRIPTION: Renders a red circular shape at (201, 124) with radius 38.
; PLAN: r0=201(x), r1=124(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 124
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
