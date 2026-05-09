; DESCRIPTION: Places a yellow circle of radius 53 at center (293, 128).
; PLAN: r0=293(x), r1=128(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 128
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
