; DESCRIPTION: Composite: Sets a single magenta pixel at (89, 177) then Renders a white line between points (139, 38) and (409, 120).
; PLAN: r0=89(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=38(y1), r7=409(x2), r8=120(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 38
LDI r7, 409
LDI r8, 120
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
