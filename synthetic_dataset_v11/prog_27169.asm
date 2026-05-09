; DESCRIPTION: Places a black circle of radius 30 at center (66, 223).
; PLAN: r0=66(x), r1=223(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 223
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
