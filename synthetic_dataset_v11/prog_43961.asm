; DESCRIPTION: Composite: . Then Places a magenta dot at position (51, 51). Then Renders a magenta disk with center (81, 128) and radius 78.
; PLAN: r0=51(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=128(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (51, 51).
; PLAN: r0=51(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (81, 128) and radius 78.
; PLAN: r0=81(x), r1=128(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 128
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
