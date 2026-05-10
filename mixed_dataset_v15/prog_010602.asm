; DESCRIPTION: Composite: Sets a single black pixel at (63, 194) then Renders a blue line between points (115, 190) and (36, 167).
; PLAN: r0=63(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=190(y1), r7=36(x2), r8=167(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 115
LDI r6, 190
LDI r7, 36
LDI r8, 167
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
