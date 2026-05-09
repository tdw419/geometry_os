; DESCRIPTION: Places a black circle of radius 25 at center (138, 128).
; PLAN: r0=138(x), r1=128(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 128
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
