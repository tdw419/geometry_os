; DESCRIPTION: Composite: Draws a magenta line from (98, 141) to (316, 227) then Creates a magenta circular shape at (389, 77) with radius 39.
; PLAN: r0=98(x1), r1=141(y1), r2=316(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=77(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 141
LDI r2, 316
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 77
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
