; DESCRIPTION: Composite: . Then Places a yellow circle of radius 75 at center (140, 119). Then Places a orange dot at position (214, 125).
; PLAN: r0=140(x), r1=119(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=214(x), r1=125(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 75 at center (140, 119).
; PLAN: r0=140(x), r1=119(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 119
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (214, 125).
; PLAN: r0=214(x), r1=125(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 125
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
