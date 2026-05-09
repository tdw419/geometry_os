; DESCRIPTION: Places a black circle of radius 46 at center (116, 133).
; PLAN: r0=116(x), r1=133(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 133
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
