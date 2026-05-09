; DESCRIPTION: Composite: . Then Places a cyan dot at position (2, 98). Then Renders a orange disk with center (158, 76) and radius 44.
; PLAN: r0=2(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=158(x), r1=76(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (2, 98).
; PLAN: r0=2(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (158, 76) and radius 44.
; PLAN: r0=158(x), r1=76(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 76
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
