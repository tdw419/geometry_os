; DESCRIPTION: Places a cyan circle of radius 14 at center (195, 25).
; PLAN: r0=195(x), r1=25(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 25
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
