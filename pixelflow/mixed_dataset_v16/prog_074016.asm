; DESCRIPTION: Composite: Sets a single purple pixel at (225, 64) then Places a magenta line segment connecting (287, 58) to (331, 165).
; PLAN: r0=225(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=58(y1), r7=331(x2), r8=165(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 58
LDI r7, 331
LDI r8, 165
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
