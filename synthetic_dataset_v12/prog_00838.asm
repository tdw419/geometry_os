; DESCRIPTION: Renders a black disk with center (485, 45) and radius 11.
; PLAN: r0=485(x), r1=45(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 45
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
