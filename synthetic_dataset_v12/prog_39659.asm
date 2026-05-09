; DESCRIPTION: Places a black circle of radius 13 at center (268, 17).
; PLAN: r0=268(x), r1=17(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 17
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
