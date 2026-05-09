; DESCRIPTION: Composite: Sets a single blue pixel at (449, 93) then Places a yellow line segment connecting (122, 118) to (241, 17).
; PLAN: r0=449(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=118(y1), r7=241(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 118
LDI r7, 241
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
