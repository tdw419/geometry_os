; DESCRIPTION: Places a black circle of radius 76 at center (261, 175).
; PLAN: r0=261(x), r1=175(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 175
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
