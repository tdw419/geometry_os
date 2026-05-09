; DESCRIPTION: Composite: Sets a single magenta pixel at (313, 133) then Draws a magenta circle centered at (66, 158) with radius 57.
; PLAN: r0=313(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=158(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 158
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
