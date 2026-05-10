; DESCRIPTION: Composite: Sets a single black pixel at (270, 192) then Places a red line segment connecting (431, 204) to (164, 254).
; PLAN: r0=270(x), r1=192(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x1), r6=204(y1), r7=164(x2), r8=254(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 192
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 204
LDI r7, 164
LDI r8, 254
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
