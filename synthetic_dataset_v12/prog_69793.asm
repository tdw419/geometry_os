; DESCRIPTION: Places a black circle of radius 80 at center (248, 132).
; PLAN: r0=248(x), r1=132(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 132
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
