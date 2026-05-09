; DESCRIPTION: Composite: . Then Places a magenta dot at position (136, 53). Then Places a magenta circle of radius 69 at center (79, 96).
; PLAN: r0=136(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=96(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (136, 53).
; PLAN: r0=136(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 69 at center (79, 96).
; PLAN: r0=79(x), r1=96(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 96
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
