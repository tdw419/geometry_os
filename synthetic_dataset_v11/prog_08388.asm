; DESCRIPTION: Composite: . Then Places a cyan dot at position (9, 35). Then Places a cyan circle of radius 39 at center (114, 123).
; PLAN: r0=9(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=114(x), r1=123(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (9, 35).
; PLAN: r0=9(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 35
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 39 at center (114, 123).
; PLAN: r0=114(x), r1=123(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 123
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
