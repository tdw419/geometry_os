; DESCRIPTION: Composite: Draws a yellow line from (130, 217) to (113, 77) then Sets a single green pixel at (36, 28).
; PLAN: r0=130(x1), r1=217(y1), r2=113(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 217
LDI r2, 113
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
