; DESCRIPTION: Composite: Sets a single red pixel at (276, 52) then Places a white line segment connecting (409, 131) to (307, 163).
; PLAN: r0=276(x), r1=52(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=409(x1), r6=131(y1), r7=307(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 52
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 409
LDI r6, 131
LDI r7, 307
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
