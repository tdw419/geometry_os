; DESCRIPTION: Composite: Sets a single purple pixel at (320, 206) then Places a purple line segment connecting (7, 210) to (508, 90).
; PLAN: r0=320(x), r1=206(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=210(y1), r7=508(x2), r8=90(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 206
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 210
LDI r7, 508
LDI r8, 90
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
