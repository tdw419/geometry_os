; DESCRIPTION: Composite: . Then Places a yellow circle of radius 28 at center (79, 78). Then Places a black dot at position (164, 126).
; PLAN: r0=79(x), r1=78(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 28 at center (79, 78).
; PLAN: r0=79(x), r1=78(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 78
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (164, 126).
; PLAN: r0=164(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
HALT
