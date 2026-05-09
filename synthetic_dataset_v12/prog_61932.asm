; DESCRIPTION: Composite: Places a yellow line segment connecting (92, 60) to (407, 211) then Places a purple dot at position (270, 111).
; PLAN: r0=92(x1), r1=60(y1), r2=407(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=111(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 60
LDI r2, 407
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 111
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
