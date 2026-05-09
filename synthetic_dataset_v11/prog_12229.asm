; DESCRIPTION: Composite: . Then Places a orange circle of radius 26 at center (126, 153). Then Sets a single cyan pixel at (7, 21).
; PLAN: r0=126(x), r1=153(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=7(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 26 at center (126, 153).
; PLAN: r0=126(x), r1=153(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 153
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (7, 21).
; PLAN: r0=7(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
