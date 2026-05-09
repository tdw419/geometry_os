; DESCRIPTION: Composite: Sets a single magenta pixel at (421, 223) then Renders a blue disk with center (368, 145) and radius 45.
; PLAN: r0=421(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=145(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 145
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
