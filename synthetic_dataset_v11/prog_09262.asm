; DESCRIPTION: Places a cyan circle of radius 25 at center (206, 201).
; PLAN: r0=206(x), r1=201(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 201
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
