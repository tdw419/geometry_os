; DESCRIPTION: Places a cyan circle of radius 65 at center (94, 170).
; PLAN: r0=94(x), r1=170(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 170
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
