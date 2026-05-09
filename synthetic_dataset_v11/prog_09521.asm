; DESCRIPTION: Composite: . Then Renders a red disk with center (155, 127) and radius 78. Then Places a magenta dot at position (134, 28).
; PLAN: r0=155(x), r1=127(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (155, 127) and radius 78.
; PLAN: r0=155(x), r1=127(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 127
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (134, 28).
; PLAN: r0=134(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
