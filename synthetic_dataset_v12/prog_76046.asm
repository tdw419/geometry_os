; DESCRIPTION: Composite: Sets a single red pixel at (115, 86) then Renders a magenta disk with center (155, 148) and radius 61.
; PLAN: r0=115(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=148(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 148
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
