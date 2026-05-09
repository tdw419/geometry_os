; DESCRIPTION: Composite: Sets a single purple pixel at (183, 38) then Renders a yellow line between points (15, 204) and (268, 20).
; PLAN: r0=183(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x1), r6=204(y1), r7=268(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 204
LDI r7, 268
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
