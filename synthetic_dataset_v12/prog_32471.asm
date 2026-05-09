; DESCRIPTION: Places a cyan circle of radius 66 at center (351, 129).
; PLAN: r0=351(x), r1=129(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 129
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
