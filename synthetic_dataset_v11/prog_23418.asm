; DESCRIPTION: Composite: . Then Renders a magenta disk with center (177, 108) and radius 72. Then Sets a single magenta pixel at (125, 132).
; PLAN: r0=177(x), r1=108(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (177, 108) and radius 72.
; PLAN: r0=177(x), r1=108(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 108
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (125, 132).
; PLAN: r0=125(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
