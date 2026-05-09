; DESCRIPTION: Composite: Sets a single white pixel at (436, 77) then Renders a purple line between points (320, 161) and (495, 172).
; PLAN: r0=436(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=161(y1), r7=495(x2), r8=172(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 161
LDI r7, 495
LDI r8, 172
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
