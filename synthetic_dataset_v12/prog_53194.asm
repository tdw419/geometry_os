; DESCRIPTION: Composite: Sets a single magenta pixel at (329, 181) then Renders a purple disk with center (202, 57) and radius 43.
; PLAN: r0=329(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=57(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 57
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
