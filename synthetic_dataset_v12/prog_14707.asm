; DESCRIPTION: Places a black circle of radius 11 at center (206, 73).
; PLAN: r0=206(x), r1=73(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 73
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
