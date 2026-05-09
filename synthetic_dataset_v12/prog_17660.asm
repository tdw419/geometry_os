; DESCRIPTION: Composite: Sets a single white pixel at (63, 166) then Renders a purple disk with center (363, 45) and radius 22.
; PLAN: r0=63(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=45(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 45
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
