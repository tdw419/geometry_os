; DESCRIPTION: Renders a green disk with center (339, 191) and radius 45.
; PLAN: r0=339(x), r1=191(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 191
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
