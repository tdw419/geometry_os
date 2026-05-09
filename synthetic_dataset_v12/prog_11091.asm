; DESCRIPTION: Places a cyan circle of radius 14 at center (83, 200).
; PLAN: r0=83(x), r1=200(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 200
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
