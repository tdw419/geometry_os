; DESCRIPTION: Composite: . Then Places a cyan circle of radius 22 at center (207, 199). Then Places a orange dot at position (140, 218).
; PLAN: r0=207(x), r1=199(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=140(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan circle of radius 22 at center (207, 199).
; PLAN: r0=207(x), r1=199(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 199
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (140, 218).
; PLAN: r0=140(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 218
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
