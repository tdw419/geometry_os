; DESCRIPTION: Composite: Sets a single red pixel at (250, 67) then Creates a magenta circular shape at (429, 57) with radius 57.
; PLAN: r0=250(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=57(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 57
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
