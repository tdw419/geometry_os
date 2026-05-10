; DESCRIPTION: Composite: Sets a single magenta pixel at (369, 150) then Renders a purple disk with center (171, 133) and radius 73.
; PLAN: r0=369(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=133(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 133
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
