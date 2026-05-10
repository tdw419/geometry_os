; DESCRIPTION: Composite: Sets a single white pixel at (415, 153) then Places a purple line segment connecting (452, 156) to (325, 95).
; PLAN: r0=415(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=156(y1), r7=325(x2), r8=95(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 156
LDI r7, 325
LDI r8, 95
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
