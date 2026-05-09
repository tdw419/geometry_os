; DESCRIPTION: Places a cyan circle of radius 39 at center (273, 66).
; PLAN: r0=273(x), r1=66(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 66
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
