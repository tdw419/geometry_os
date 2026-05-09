; DESCRIPTION: Composite: Sets a single cyan pixel at (373, 68) then Places a magenta line segment connecting (304, 198) to (370, 131).
; PLAN: r0=373(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=198(y1), r7=370(x2), r8=131(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 198
LDI r7, 370
LDI r8, 131
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
