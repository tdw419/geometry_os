; DESCRIPTION: Composite: Places a black dot at position (332, 108) then Places a magenta line segment connecting (343, 177) to (228, 228).
; PLAN: r0=332(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=343(x1), r6=177(y1), r7=228(x2), r8=228(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 177
LDI r7, 228
LDI r8, 228
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
