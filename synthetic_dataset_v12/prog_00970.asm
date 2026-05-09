; DESCRIPTION: Composite: Places a black dot at position (273, 58) then Places a magenta line segment connecting (64, 254) to (205, 149).
; PLAN: r0=273(x), r1=58(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=254(y1), r7=205(x2), r8=149(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 58
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 64
LDI r6, 254
LDI r7, 205
LDI r8, 149
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
