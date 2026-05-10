; DESCRIPTION: Places a cyan disk with center (314, 93) and radius 16.
; PLAN: r0=314(x), r1=93(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 93
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
