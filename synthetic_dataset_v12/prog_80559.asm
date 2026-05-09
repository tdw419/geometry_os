; DESCRIPTION: Places a cyan circle of radius 45 at center (422, 140).
; PLAN: r0=422(x), r1=140(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 140
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
