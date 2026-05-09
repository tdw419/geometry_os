; DESCRIPTION: Composite: . Then Draws a purple circle centered at (115, 139) with radius 47. Then Places a cyan dot at position (245, 132).
; PLAN: r0=115(x), r1=139(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=245(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (115, 139) with radius 47.
; PLAN: r0=115(x), r1=139(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 139
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (245, 132).
; PLAN: r0=245(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
