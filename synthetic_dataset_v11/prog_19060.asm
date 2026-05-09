; DESCRIPTION: Composite: . Then Renders a magenta disk with center (164, 51) and radius 44. Then Sets a single purple pixel at (167, 68).
; PLAN: r0=164(x), r1=51(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=167(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (164, 51) and radius 44.
; PLAN: r0=164(x), r1=51(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 51
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (167, 68).
; PLAN: r0=167(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
