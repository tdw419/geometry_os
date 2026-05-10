; DESCRIPTION: Composite: Places a purple line segment connecting (249, 47) to (378, 101) then Places a magenta circle of radius 10 at center (221, 189).
; PLAN: r0=249(x1), r1=47(y1), r2=378(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=189(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 47
LDI r2, 378
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 189
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
