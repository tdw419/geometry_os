; DESCRIPTION: Composite: . Then Places a blue dot at position (93, 16). Then Places a orange circle of radius 46 at center (137, 108).
; PLAN: r0=93(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=137(x), r1=108(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (93, 16).
; PLAN: r0=93(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 46 at center (137, 108).
; PLAN: r0=137(x), r1=108(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 108
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
