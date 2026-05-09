; DESCRIPTION: Composite: Draws a white line from (379, 54) to (460, 83) then Sets a single white pixel at (58, 7).
; PLAN: r0=379(x1), r1=54(y1), r2=460(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=7(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 54
LDI r2, 460
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 7
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
