; DESCRIPTION: Composite: Sets a single white pixel at (236, 190) then Places a black line segment connecting (487, 50) to (292, 35).
; PLAN: r0=236(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=50(y1), r7=292(x2), r8=35(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 50
LDI r7, 292
LDI r8, 35
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
