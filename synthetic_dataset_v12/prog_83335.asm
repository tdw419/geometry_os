; DESCRIPTION: Places a cyan circle of radius 21 at center (483, 187).
; PLAN: r0=483(x), r1=187(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 483
LDI r1, 187
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
