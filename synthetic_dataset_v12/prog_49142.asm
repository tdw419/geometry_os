; DESCRIPTION: Places a black circle of radius 71 at center (132, 133).
; PLAN: r0=132(x), r1=133(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 133
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
