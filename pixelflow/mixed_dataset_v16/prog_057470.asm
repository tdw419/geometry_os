; DESCRIPTION: Places a black circle of radius 32 at center (172, 98).
; PLAN: r0=172(x), r1=98(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 98
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
