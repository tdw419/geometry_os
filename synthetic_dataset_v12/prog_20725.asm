; DESCRIPTION: Composite: Places a purple dot at position (2, 254) then Places a purple line segment connecting (151, 63) to (402, 131).
; PLAN: r0=2(x), r1=254(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=151(x1), r6=63(y1), r7=402(x2), r8=131(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 254
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 63
LDI r7, 402
LDI r8, 131
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
