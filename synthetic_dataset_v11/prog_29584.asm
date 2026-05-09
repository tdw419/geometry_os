; DESCRIPTION: Composite: . Then Renders a purple disk with center (176, 125) and radius 39. Then Sets a single blue pixel at (170, 113).
; PLAN: r0=176(x), r1=125(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (176, 125) and radius 39.
; PLAN: r0=176(x), r1=125(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 125
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (170, 113).
; PLAN: r0=170(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
