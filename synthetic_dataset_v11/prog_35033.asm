; DESCRIPTION: Places a cyan circle of radius 64 at center (110, 118).
; PLAN: r0=110(x), r1=118(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 118
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
