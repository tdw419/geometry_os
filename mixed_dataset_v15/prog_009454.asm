; DESCRIPTION: Composite: Places a cyan line segment connecting (110, 73) to (246, 110) then Sets a single black pixel at (277, 162).
; PLAN: r0=110(x1), r1=73(y1), r2=246(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=162(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 73
LDI r2, 246
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 162
LDI r7, 0x000000
PSET r5, r6, r7
HALT
