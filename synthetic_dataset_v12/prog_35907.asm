; DESCRIPTION: Composite: Sets a single magenta pixel at (438, 142) then Renders a blue disk with center (357, 99) and radius 20.
; PLAN: r0=438(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=99(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 99
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
