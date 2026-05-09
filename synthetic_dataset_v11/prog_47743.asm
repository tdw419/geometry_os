; DESCRIPTION: Composite: . Then Places a purple circle of radius 50 at center (166, 148). Then Places a cyan dot at position (181, 114).
; PLAN: r0=166(x), r1=148(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 50 at center (166, 148).
; PLAN: r0=166(x), r1=148(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 148
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (181, 114).
; PLAN: r0=181(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 114
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
