; DESCRIPTION: Composite: Sets a single purple pixel at (473, 131) then Renders a red line between points (146, 223) and (192, 191).
; PLAN: r0=473(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=223(y1), r7=192(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 223
LDI r7, 192
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
