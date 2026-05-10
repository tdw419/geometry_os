; DESCRIPTION: Composite: Places a yellow dot at position (378, 211) then Renders a purple disk with center (284, 81) and radius 36.
; PLAN: r0=378(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=81(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 81
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
