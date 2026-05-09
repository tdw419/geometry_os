; DESCRIPTION: Composite: Places a blue dot at position (378, 250) then Renders a black box of size 26x97 starting at (36, 106).
; PLAN: r0=378(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=106(y), r7=26(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 106
LDI r7, 26
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
