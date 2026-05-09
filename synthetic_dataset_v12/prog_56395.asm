; DESCRIPTION: Composite: Places a magenta line segment connecting (378, 21) to (291, 154) then Sets a single cyan pixel at (253, 149).
; PLAN: r0=378(x1), r1=21(y1), r2=291(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=149(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 21
LDI r2, 291
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 149
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
