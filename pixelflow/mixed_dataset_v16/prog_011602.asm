; DESCRIPTION: Composite: Places a black line segment connecting (12, 220) to (3, 205) then Sets a single yellow pixel at (422, 82).
; PLAN: r0=12(x1), r1=220(y1), r2=3(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=82(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 220
LDI r2, 3
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 82
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
