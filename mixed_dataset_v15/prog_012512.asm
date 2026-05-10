; DESCRIPTION: Composite: Places a blue dot at position (471, 94) then Places a green line segment connecting (447, 197) to (162, 25).
; PLAN: r0=471(x), r1=94(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=197(y1), r7=162(x2), r8=25(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 94
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 197
LDI r7, 162
LDI r8, 25
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
