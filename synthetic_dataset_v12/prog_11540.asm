; DESCRIPTION: Places a cyan circle of radius 13 at center (251, 106).
; PLAN: r0=251(x), r1=106(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 106
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
