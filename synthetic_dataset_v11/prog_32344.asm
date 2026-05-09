; DESCRIPTION: Places a black circle of radius 19 at center (164, 219).
; PLAN: r0=164(x), r1=219(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 219
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
