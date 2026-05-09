; DESCRIPTION: Composite: . Then Renders a magenta disk with center (139, 100) and radius 79. Then Places a black dot at position (148, 4).
; PLAN: r0=139(x), r1=100(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=148(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (139, 100) and radius 79.
; PLAN: r0=139(x), r1=100(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 100
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (148, 4).
; PLAN: r0=148(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
HALT
