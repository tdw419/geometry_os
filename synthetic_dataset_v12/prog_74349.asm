; DESCRIPTION: Composite: Sets a single white pixel at (422, 170) then Draws a yellow line from (152, 110) to (308, 131).
; PLAN: r0=422(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=110(y1), r7=308(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 110
LDI r7, 308
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
