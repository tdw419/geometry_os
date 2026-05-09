; DESCRIPTION: Places a cyan circle of radius 20 at center (462, 89).
; PLAN: r0=462(x), r1=89(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 89
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
