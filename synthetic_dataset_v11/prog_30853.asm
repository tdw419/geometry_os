; DESCRIPTION: Places a black circle of radius 71 at center (110, 126).
; PLAN: r0=110(x), r1=126(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 126
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
