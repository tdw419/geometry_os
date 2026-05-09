; DESCRIPTION: Composite: . Then Places a yellow dot at position (153, 145). Then Places a orange circle of radius 15 at center (90, 230).
; PLAN: r0=153(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=230(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (153, 145).
; PLAN: r0=153(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 145
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 15 at center (90, 230).
; PLAN: r0=90(x), r1=230(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 230
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
