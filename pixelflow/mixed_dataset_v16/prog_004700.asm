; DESCRIPTION: Composite: Sets a single cyan pixel at (387, 179) then Places a magenta line segment connecting (417, 158) to (318, 59).
; PLAN: r0=387(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=158(y1), r7=318(x2), r8=59(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 158
LDI r7, 318
LDI r8, 59
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
