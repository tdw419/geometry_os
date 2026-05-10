; DESCRIPTION: Composite: Sets a single magenta pixel at (315, 252) then Places a purple circle of radius 38 at center (169, 144).
; PLAN: r0=315(x), r1=252(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=144(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 252
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 144
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
