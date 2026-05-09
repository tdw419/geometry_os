; DESCRIPTION: Places a cyan circle of radius 66 at center (89, 137).
; PLAN: r0=89(x), r1=137(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 137
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
