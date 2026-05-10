; DESCRIPTION: Composite: Places a purple line segment connecting (335, 243) to (129, 134) then Creates a magenta circular shape at (51, 57) with radius 26.
; PLAN: r0=335(x1), r1=243(y1), r2=129(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=57(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 243
LDI r2, 129
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 57
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
