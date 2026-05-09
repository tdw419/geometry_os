; DESCRIPTION: Composite: Sets a single blue pixel at (153, 211) then Places a purple line segment connecting (304, 94) to (38, 64).
; PLAN: r0=153(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=94(y1), r7=38(x2), r8=64(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 94
LDI r7, 38
LDI r8, 64
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
