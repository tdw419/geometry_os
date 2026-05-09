; DESCRIPTION: Composite: . Then Renders a white disk with center (202, 134) and radius 24. Then Sets a single purple pixel at (78, 207).
; PLAN: r0=202(x), r1=134(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (202, 134) and radius 24.
; PLAN: r0=202(x), r1=134(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 134
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (78, 207).
; PLAN: r0=78(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 207
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
