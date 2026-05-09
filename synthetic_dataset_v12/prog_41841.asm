; DESCRIPTION: Places a black circle of radius 45 at center (306, 87).
; PLAN: r0=306(x), r1=87(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 87
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
