; DESCRIPTION: Places a cyan circle of radius 16 at center (467, 66).
; PLAN: r0=467(x), r1=66(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 66
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
