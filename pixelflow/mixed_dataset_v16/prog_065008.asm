; DESCRIPTION: Composite: Sets a single white pixel at (19, 138) then Renders a yellow line between points (495, 219) and (413, 241).
; PLAN: r0=19(x), r1=138(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=219(y1), r7=413(x2), r8=241(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 138
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 495
LDI r6, 219
LDI r7, 413
LDI r8, 241
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
