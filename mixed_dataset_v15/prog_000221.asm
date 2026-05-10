; DESCRIPTION: Composite: Sets a single red pixel at (156, 80) then Places a black line segment connecting (329, 218) to (403, 4).
; PLAN: r0=156(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=329(x1), r6=218(y1), r7=403(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 329
LDI r6, 218
LDI r7, 403
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
