; DESCRIPTION: Composite: Sets a single purple pixel at (36, 64) then Renders a magenta line between points (341, 79) and (234, 91).
; PLAN: r0=36(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=341(x1), r6=79(y1), r7=234(x2), r8=91(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 79
LDI r7, 234
LDI r8, 91
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
