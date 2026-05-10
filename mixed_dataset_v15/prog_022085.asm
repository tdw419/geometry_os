; DESCRIPTION: Places a cyan circle of radius 18 at center (118, 89).
; PLAN: r0=118(x), r1=89(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 89
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
