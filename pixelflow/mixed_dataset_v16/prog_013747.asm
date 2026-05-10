; DESCRIPTION: Composite: Places a red circle of radius 34 at center (51, 112) then Sets a single purple pixel at (267, 136).
; PLAN: r0=51(x), r1=112(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 112
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
