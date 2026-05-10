; DESCRIPTION: Renders a black disk with center (340, 214) and radius 39.
; PLAN: r0=340(x), r1=214(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 214
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
