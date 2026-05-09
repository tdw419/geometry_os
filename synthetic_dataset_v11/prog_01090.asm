; DESCRIPTION: Composite: . Then Sets a single green pixel at (46, 214). Then Places a yellow circle of radius 53 at center (180, 125).
; PLAN: r0=46(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=180(x), r1=125(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (46, 214).
; PLAN: r0=46(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 53 at center (180, 125).
; PLAN: r0=180(x), r1=125(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 125
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
