; DESCRIPTION: Composite: Sets a single orange pixel at (256, 234) then Places a yellow line segment connecting (348, 238) to (106, 7).
; PLAN: r0=256(x), r1=234(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=238(y1), r7=106(x2), r8=7(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 234
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 348
LDI r6, 238
LDI r7, 106
LDI r8, 7
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
