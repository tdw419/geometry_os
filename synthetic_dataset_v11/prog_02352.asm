; DESCRIPTION: Composite: . Then Sets a single orange pixel at (197, 114). Then Places a cyan circle of radius 35 at center (130, 122).
; PLAN: r0=197(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=130(x), r1=122(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (197, 114).
; PLAN: r0=197(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 35 at center (130, 122).
; PLAN: r0=130(x), r1=122(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 122
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
