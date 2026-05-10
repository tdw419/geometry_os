; DESCRIPTION: Composite: Places a green dot at position (33, 139) then Renders a black disk with center (357, 79) and radius 52.
; PLAN: r0=33(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=79(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 357
LDI r6, 79
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
