; DESCRIPTION: Places a black circle of radius 80 at center (157, 133).
; PLAN: r0=157(x), r1=133(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 133
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
