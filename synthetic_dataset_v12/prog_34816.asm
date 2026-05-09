; DESCRIPTION: Composite: Sets a single blue pixel at (40, 220) then Draws a cyan line from (391, 131) to (264, 54).
; PLAN: r0=40(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=131(y1), r7=264(x2), r8=54(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 131
LDI r7, 264
LDI r8, 54
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
