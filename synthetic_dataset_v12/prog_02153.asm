; DESCRIPTION: Places a cyan circle of radius 16 at center (31, 61).
; PLAN: r0=31(x), r1=61(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 61
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
