; DESCRIPTION: Places a cyan circle of radius 76 at center (179, 129).
; PLAN: r0=179(x), r1=129(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 129
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
