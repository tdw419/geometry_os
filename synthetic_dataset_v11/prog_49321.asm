; DESCRIPTION: Composite: . Then Places a cyan dot at position (73, 41). Then Places a orange circle of radius 47 at center (82, 130).
; PLAN: r0=73(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=82(x), r1=130(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (73, 41).
; PLAN: r0=73(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 47 at center (82, 130).
; PLAN: r0=82(x), r1=130(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 130
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
