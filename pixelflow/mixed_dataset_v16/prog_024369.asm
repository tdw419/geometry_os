; DESCRIPTION: Composite: Sets a single cyan pixel at (119, 53) then Places a magenta line segment connecting (324, 107) to (69, 218).
; PLAN: r0=119(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=107(y1), r7=69(x2), r8=218(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 53
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 107
LDI r7, 69
LDI r8, 218
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
