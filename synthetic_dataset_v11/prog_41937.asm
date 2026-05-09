; DESCRIPTION: Composite: . Then Places a white circle of radius 70 at center (95, 159). Then Sets a single orange pixel at (23, 175).
; PLAN: r0=95(x), r1=159(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 70 at center (95, 159).
; PLAN: r0=95(x), r1=159(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 159
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (23, 175).
; PLAN: r0=23(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
