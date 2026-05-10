; DESCRIPTION: Composite: Places a magenta dot at position (351, 56) then Places a blue line segment connecting (204, 25) to (311, 17).
; PLAN: r0=351(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=25(y1), r7=311(x2), r8=17(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 25
LDI r7, 311
LDI r8, 17
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
