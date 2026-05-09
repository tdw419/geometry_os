; DESCRIPTION: Places a black circle of radius 13 at center (272, 20).
; PLAN: r0=272(x), r1=20(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 20
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
