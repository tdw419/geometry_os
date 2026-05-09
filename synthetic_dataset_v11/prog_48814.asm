; DESCRIPTION: Composite: . Then Places a orange dot at position (225, 137). Then Renders a black disk with center (75, 95) and radius 58.
; PLAN: r0=225(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=95(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (225, 137).
; PLAN: r0=225(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 137
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (75, 95) and radius 58.
; PLAN: r0=75(x), r1=95(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 95
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
