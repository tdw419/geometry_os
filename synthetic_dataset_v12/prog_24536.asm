; DESCRIPTION: Composite: Sets a single magenta pixel at (451, 49) then Draws a green line from (378, 102) to (333, 124).
; PLAN: r0=451(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=102(y1), r7=333(x2), r8=124(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 102
LDI r7, 333
LDI r8, 124
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
