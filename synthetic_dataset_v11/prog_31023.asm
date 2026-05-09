; DESCRIPTION: Composite: . Then Sets a single red pixel at (100, 207). Then Renders a magenta disk with center (126, 198) and radius 29.
; PLAN: r0=100(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=198(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (100, 207).
; PLAN: r0=100(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 207
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (126, 198) and radius 29.
; PLAN: r0=126(x), r1=198(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 198
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
