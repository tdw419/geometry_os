; DESCRIPTION: Composite: . Then Sets a single orange pixel at (250, 22). Then Places a black circle of radius 62 at center (103, 125).
; PLAN: r0=250(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=125(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (250, 22).
; PLAN: r0=250(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a black circle of radius 62 at center (103, 125).
; PLAN: r0=103(x), r1=125(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 125
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
