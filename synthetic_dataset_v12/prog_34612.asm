; DESCRIPTION: Renders a red disk with center (297, 191) and radius 46.
; PLAN: r0=297(x), r1=191(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 191
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
