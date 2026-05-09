; DESCRIPTION: Composite: . Then Places a orange dot at position (221, 161). Then Places a yellow circle of radius 19 at center (26, 105).
; PLAN: r0=221(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=26(x), r1=105(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (221, 161).
; PLAN: r0=221(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 161
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 19 at center (26, 105).
; PLAN: r0=26(x), r1=105(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 105
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
