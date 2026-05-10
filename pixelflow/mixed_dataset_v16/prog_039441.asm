; DESCRIPTION: Composite: Sets a single yellow pixel at (430, 221) then Places a yellow line segment connecting (145, 190) to (254, 79) then Places a magenta circle of radius 72 at center (378, 92).
; PLAN: r0=430(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=145(x1), r6=190(y1), r7=254(x2), r8=79(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=92(y), r12=72(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 190
LDI r7, 254
LDI r8, 79
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 92
LDI r12, 72
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
