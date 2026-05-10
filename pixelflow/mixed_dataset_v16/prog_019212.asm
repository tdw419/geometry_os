; DESCRIPTION: Composite: Sets a single magenta pixel at (337, 136) then Renders a white disk with center (248, 174) and radius 80.
; PLAN: r0=337(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=174(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 174
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
