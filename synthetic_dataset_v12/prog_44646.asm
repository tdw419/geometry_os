; DESCRIPTION: Composite: Places a black circle of radius 47 at center (69, 190) then Draws a cyan line from (223, 106) to (211, 2) then Sets a single blue pixel at (377, 248).
; PLAN: r0=69(x), r1=190(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=106(y1), r7=211(x2), r8=2(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=248(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 190
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 106
LDI r7, 211
LDI r8, 2
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 248
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
