; DESCRIPTION: Composite: Sets a single red pixel at (422, 212) then Places a yellow line segment connecting (185, 129) to (300, 110).
; PLAN: r0=422(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=129(y1), r7=300(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 185
LDI r6, 129
LDI r7, 300
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
