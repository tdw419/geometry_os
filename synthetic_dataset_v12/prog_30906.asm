; DESCRIPTION: Composite: Sets a single red pixel at (372, 212) then Places a black line segment connecting (503, 240) to (240, 218).
; PLAN: r0=372(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=503(x1), r6=240(y1), r7=240(x2), r8=218(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 503
LDI r6, 240
LDI r7, 240
LDI r8, 218
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
