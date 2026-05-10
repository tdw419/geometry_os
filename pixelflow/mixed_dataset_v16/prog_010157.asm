; DESCRIPTION: Composite: Renders a magenta line between points (89, 2) and (117, 228) then Sets a single black pixel at (498, 115).
; PLAN: r0=89(x1), r1=2(y1), r2=117(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 2
LDI r2, 117
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
HALT
