; DESCRIPTION: Composite: . Then Renders a magenta disk with center (131, 53) and radius 50. Then Sets a single red pixel at (143, 79).
; PLAN: r0=131(x), r1=53(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=143(x), r1=79(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (131, 53) and radius 50.
; PLAN: r0=131(x), r1=53(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 53
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (143, 79).
; PLAN: r0=143(x), r1=79(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 79
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
