; DESCRIPTION: Composite: Sets a single cyan pixel at (102, 15) then Draws a black line from (94, 70) to (418, 151).
; PLAN: r0=102(x), r1=15(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=70(y1), r7=418(x2), r8=151(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 15
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 70
LDI r7, 418
LDI r8, 151
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
