; DESCRIPTION: Composite: . Then Places a red circle of radius 19 at center (60, 176). Then Sets a single cyan pixel at (181, 99).
; PLAN: r0=60(x), r1=176(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 19 at center (60, 176).
; PLAN: r0=60(x), r1=176(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 176
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (181, 99).
; PLAN: r0=181(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
