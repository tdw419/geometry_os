; DESCRIPTION: Composite: Sets a single purple pixel at (321, 99) then Renders a purple disk with center (78, 114) and radius 68.
; PLAN: r0=321(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=114(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 114
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
