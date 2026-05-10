; DESCRIPTION: Composite: Places a magenta line segment connecting (285, 34) to (126, 152) then Sets a single yellow pixel at (313, 110).
; PLAN: r0=285(x1), r1=34(y1), r2=126(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 34
LDI r2, 126
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
