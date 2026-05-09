; DESCRIPTION: Renders a orange disk with center (90, 191) and radius 22.
; PLAN: r0=90(x), r1=191(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 191
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
