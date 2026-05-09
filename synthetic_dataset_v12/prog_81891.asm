; DESCRIPTION: Places a black circle of radius 58 at center (84, 126).
; PLAN: r0=84(x), r1=126(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 126
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
