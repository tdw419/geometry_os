; DESCRIPTION: Places a cyan disk with center (314, 7) and radius 13.
; PLAN: r0=314(x), r1=7(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 7
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
