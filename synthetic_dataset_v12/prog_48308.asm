; DESCRIPTION: Places a black circle of radius 26 at center (306, 219).
; PLAN: r0=306(x), r1=219(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 219
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
