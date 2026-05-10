; DESCRIPTION: Composite: Draws a purple line from (112, 145) to (105, 143) then Places a white circle of radius 15 at center (348, 36).
; PLAN: r0=112(x1), r1=145(y1), r2=105(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=36(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 145
LDI r2, 105
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 36
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
