; DESCRIPTION: Composite: Sets a single blue pixel at (373, 24) then Renders a black line between points (66, 224) and (6, 211).
; PLAN: r0=373(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=224(y1), r7=6(x2), r8=211(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 224
LDI r7, 6
LDI r8, 211
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
