; DESCRIPTION: Composite: Sets a single magenta pixel at (313, 0) then Renders a red line between points (324, 73) and (7, 177).
; PLAN: r0=313(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=73(y1), r7=7(x2), r8=177(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 0
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 73
LDI r7, 7
LDI r8, 177
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
