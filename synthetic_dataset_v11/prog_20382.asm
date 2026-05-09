; DESCRIPTION: Composite: . Then Sets a single green pixel at (231, 207). Then Places a orange circle of radius 30 at center (139, 207).
; PLAN: r0=231(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=139(x), r1=207(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (231, 207).
; PLAN: r0=231(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 30 at center (139, 207).
; PLAN: r0=139(x), r1=207(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 207
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
