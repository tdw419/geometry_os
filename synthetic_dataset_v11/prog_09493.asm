; DESCRIPTION: Composite: . Then Renders a magenta disk with center (173, 107) and radius 61. Then Sets a single red pixel at (69, 180).
; PLAN: r0=173(x), r1=107(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x), r1=180(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (173, 107) and radius 61.
; PLAN: r0=173(x), r1=107(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 107
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (69, 180).
; PLAN: r0=69(x), r1=180(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 180
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
