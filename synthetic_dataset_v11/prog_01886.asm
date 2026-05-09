; DESCRIPTION: Composite: . Then Places a cyan 83x61 rectangle at position (37, 110). Then Sets a single yellow pixel at (204, 89).
; PLAN: r0=37(x), r1=110(y), r2=83(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=204(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 83x61 rectangle at position (37, 110).
; PLAN: r0=37(x), r1=110(y), r2=83(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 110
LDI r2, 83
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (204, 89).
; PLAN: r0=204(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
