; DESCRIPTION: Composite: Sets a single red pixel at (151, 197) then Places a purple line segment connecting (230, 123) to (412, 254).
; PLAN: r0=151(x), r1=197(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=123(y1), r7=412(x2), r8=254(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 197
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 230
LDI r6, 123
LDI r7, 412
LDI r8, 254
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
