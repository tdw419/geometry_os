; DESCRIPTION: Places a cyan circle of radius 80 at center (325, 121).
; PLAN: r0=325(x), r1=121(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 121
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
