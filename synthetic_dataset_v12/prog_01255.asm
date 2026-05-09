; DESCRIPTION: Composite: Places a red line segment connecting (261, 93) to (217, 21) then Sets a single white pixel at (36, 17).
; PLAN: r0=261(x1), r1=93(y1), r2=217(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=17(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 93
LDI r2, 217
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 17
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
