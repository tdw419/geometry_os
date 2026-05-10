; DESCRIPTION: Composite: Places a black dot at position (155, 185) then Places a yellow line segment connecting (309, 118) to (310, 71).
; PLAN: r0=155(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=118(y1), r7=310(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 118
LDI r7, 310
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
