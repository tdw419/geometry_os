; DESCRIPTION: Places a cyan circle of radius 34 at center (201, 160).
; PLAN: r0=201(x), r1=160(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 160
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
