; DESCRIPTION: Composite: Sets a single black pixel at (304, 95) then Renders a magenta line between points (148, 212) and (189, 118).
; PLAN: r0=304(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=212(y1), r7=189(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 148
LDI r6, 212
LDI r7, 189
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
