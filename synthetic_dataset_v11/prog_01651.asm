; DESCRIPTION: Places a black circle of radius 64 at center (90, 65).
; PLAN: r0=90(x), r1=65(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 65
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
