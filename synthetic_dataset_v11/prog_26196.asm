; DESCRIPTION: Places a black circle of radius 68 at center (181, 115).
; PLAN: r0=181(x), r1=115(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 115
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
