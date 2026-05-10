; DESCRIPTION: Composite: Draws a purple line from (312, 245) to (217, 210) then Creates a red circular shape at (369, 72) with radius 49.
; PLAN: r0=312(x1), r1=245(y1), r2=217(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=72(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 245
LDI r2, 217
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 72
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
