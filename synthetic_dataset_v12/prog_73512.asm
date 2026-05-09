; DESCRIPTION: Places a cyan circle of radius 57 at center (363, 161).
; PLAN: r0=363(x), r1=161(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 161
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
