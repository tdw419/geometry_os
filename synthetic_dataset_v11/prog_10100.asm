; DESCRIPTION: Renders a yellow disk with center (90, 191) and radius 28.
; PLAN: r0=90(x), r1=191(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 191
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
