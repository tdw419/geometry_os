; DESCRIPTION: Composite: Sets a single blue pixel at (194, 186) then Places a purple line segment connecting (332, 69) to (32, 128).
; PLAN: r0=194(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=332(x1), r6=69(y1), r7=32(x2), r8=128(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 69
LDI r7, 32
LDI r8, 128
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
