; DESCRIPTION: Places a black circle of radius 11 at center (52, 190).
; PLAN: r0=52(x), r1=190(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 190
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
