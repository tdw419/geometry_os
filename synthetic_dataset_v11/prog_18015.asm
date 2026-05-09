; DESCRIPTION: Places a black circle of radius 25 at center (177, 64).
; PLAN: r0=177(x), r1=64(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 64
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
