; DESCRIPTION: Composite: . Then Places a black dot at position (52, 114). Then Draws a black circle centered at (93, 97) with radius 26.
; PLAN: r0=52(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=97(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (52, 114).
; PLAN: r0=52(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (93, 97) with radius 26.
; PLAN: r0=93(x), r1=97(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 97
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
