; DESCRIPTION: Composite: . Then Sets a single purple pixel at (103, 138). Then Renders a purple disk with center (127, 156) and radius 35.
; PLAN: r0=103(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=127(x), r1=156(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (103, 138).
; PLAN: r0=103(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (127, 156) and radius 35.
; PLAN: r0=127(x), r1=156(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 156
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
