; DESCRIPTION: Places a black circle of radius 79 at center (126, 112).
; PLAN: r0=126(x), r1=112(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 112
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
