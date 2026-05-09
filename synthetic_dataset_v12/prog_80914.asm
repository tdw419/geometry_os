; DESCRIPTION: Composite: Sets a single blue pixel at (276, 220) then Renders a yellow line between points (93, 52) and (111, 170).
; PLAN: r0=276(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=52(y1), r7=111(x2), r8=170(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 52
LDI r7, 111
LDI r8, 170
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
