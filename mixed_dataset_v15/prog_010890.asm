; DESCRIPTION: Places a yellow disk with center (289, 165) and radius 25.
; PLAN: r0=289(x), r1=165(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 165
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
