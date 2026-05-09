; DESCRIPTION: Composite: . Then Sets a single red pixel at (228, 63). Then Creates a magenta circular shape at (203, 51) with radius 51.
; PLAN: r0=228(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=203(x), r1=51(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (228, 63).
; PLAN: r0=228(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (203, 51) with radius 51.
; PLAN: r0=203(x), r1=51(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 51
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
