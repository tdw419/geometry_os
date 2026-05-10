; DESCRIPTION: Renders a red disk with center (199, 101) and radius 72.
; PLAN: r0=199(x), r1=101(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 101
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
