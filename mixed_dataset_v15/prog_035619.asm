; DESCRIPTION: Composite: Sets a single purple pixel at (15, 90) then Places a purple line segment connecting (219, 190) to (130, 24).
; PLAN: r0=15(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=190(y1), r7=130(x2), r8=24(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 190
LDI r7, 130
LDI r8, 24
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
