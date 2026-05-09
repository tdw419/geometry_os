; DESCRIPTION: Composite: . Then Places a red circle of radius 65 at center (122, 79). Then Places a blue dot at position (178, 226).
; PLAN: r0=122(x), r1=79(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 65 at center (122, 79).
; PLAN: r0=122(x), r1=79(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 79
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (178, 226).
; PLAN: r0=178(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 226
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
