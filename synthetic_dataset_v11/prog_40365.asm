; DESCRIPTION: Composite: . Then Renders a magenta disk with center (66, 189) and radius 66. Then Sets a single red pixel at (196, 210).
; PLAN: r0=66(x), r1=189(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (66, 189) and radius 66.
; PLAN: r0=66(x), r1=189(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 189
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (196, 210).
; PLAN: r0=196(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
