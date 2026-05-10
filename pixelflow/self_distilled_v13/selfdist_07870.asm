; DESCRIPTION: Renders a red circular shape at (297, 100) with radius 56.
; PLAN: r0=297(x), r1=100(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 100
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
