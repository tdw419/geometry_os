; DESCRIPTION: Composite: Sets a single blue pixel at (466, 180) then Draws a blue line from (129, 8) to (386, 170).
; PLAN: r0=466(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=8(y1), r7=386(x2), r8=170(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 8
LDI r7, 386
LDI r8, 170
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
