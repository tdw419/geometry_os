; DESCRIPTION: Places a cyan circle of radius 75 at center (417, 129).
; PLAN: r0=417(x), r1=129(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 129
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
