; DESCRIPTION: Places a cyan circle of radius 30 at center (468, 64).
; PLAN: r0=468(x), r1=64(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 64
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
