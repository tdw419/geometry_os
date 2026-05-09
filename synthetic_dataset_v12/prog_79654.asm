; DESCRIPTION: Composite: Draws a orange line from (316, 199) to (71, 48) then Draws a red circle centered at (118, 178) with radius 56.
; PLAN: r0=316(x1), r1=199(y1), r2=71(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=178(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 199
LDI r2, 71
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 178
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
