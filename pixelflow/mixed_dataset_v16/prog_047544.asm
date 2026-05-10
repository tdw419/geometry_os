; DESCRIPTION: Places a black circle of radius 79 at center (387, 101).
; PLAN: r0=387(x), r1=101(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 101
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
