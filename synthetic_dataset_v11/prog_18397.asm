; DESCRIPTION: Places a black circle of radius 60 at center (133, 84).
; PLAN: r0=133(x), r1=84(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 84
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
