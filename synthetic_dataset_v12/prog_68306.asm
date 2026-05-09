; DESCRIPTION: Composite: Places a blue dot at position (354, 107) then Places a purple line segment connecting (266, 246) to (80, 133).
; PLAN: r0=354(x), r1=107(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=246(y1), r7=80(x2), r8=133(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 107
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 246
LDI r7, 80
LDI r8, 133
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
