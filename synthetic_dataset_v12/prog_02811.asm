; DESCRIPTION: Composite: Renders a white disk with center (313, 148) and radius 45 then Sets a single magenta pixel at (177, 28).
; PLAN: r0=313(x), r1=148(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=28(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 148
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 28
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
