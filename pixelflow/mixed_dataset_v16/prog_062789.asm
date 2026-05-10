; DESCRIPTION: Composite: Sets a single white pixel at (491, 22) then Renders a purple line between points (77, 43) and (234, 48).
; PLAN: r0=491(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x1), r6=43(y1), r7=234(x2), r8=48(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 43
LDI r7, 234
LDI r8, 48
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
