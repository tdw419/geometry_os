; DESCRIPTION: Composite: . Then Draws a white circle centered at (113, 77) with radius 74. Then Sets a single purple pixel at (170, 78).
; PLAN: r0=113(x), r1=77(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (113, 77) with radius 74.
; PLAN: r0=113(x), r1=77(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 77
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (170, 78).
; PLAN: r0=170(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 78
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
