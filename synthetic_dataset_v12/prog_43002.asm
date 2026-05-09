; DESCRIPTION: Places a black circle of radius 21 at center (128, 122).
; PLAN: r0=128(x), r1=122(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 122
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
