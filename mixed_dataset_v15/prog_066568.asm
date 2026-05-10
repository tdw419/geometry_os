; DESCRIPTION: Composite: Sets a single magenta pixel at (419, 147) then Draws a purple circle centered at (234, 168) with radius 54.
; PLAN: r0=419(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=168(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 168
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
