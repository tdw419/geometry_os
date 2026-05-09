; DESCRIPTION: Places a black circle of radius 49 at center (415, 149).
; PLAN: r0=415(x), r1=149(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 149
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
