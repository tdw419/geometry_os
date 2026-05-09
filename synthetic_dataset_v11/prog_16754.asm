; DESCRIPTION: Composite: . Then Sets a single black pixel at (193, 193). Then Renders a magenta disk with center (51, 125) and radius 13.
; PLAN: r0=193(x), r1=193(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=125(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (193, 193).
; PLAN: r0=193(x), r1=193(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 193
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (51, 125) and radius 13.
; PLAN: r0=51(x), r1=125(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 125
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
