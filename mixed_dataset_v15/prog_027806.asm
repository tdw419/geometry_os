; DESCRIPTION: Composite: Places a cyan dot at position (378, 6) then Renders a black disk with center (67, 80) and radius 67.
; PLAN: r0=378(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=80(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 80
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
