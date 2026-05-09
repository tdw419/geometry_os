; DESCRIPTION: Composite: . Then Places a blue circle of radius 36 at center (171, 104). Then Sets a single purple pixel at (51, 122).
; PLAN: r0=171(x), r1=104(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=51(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 36 at center (171, 104).
; PLAN: r0=171(x), r1=104(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 104
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (51, 122).
; PLAN: r0=51(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
