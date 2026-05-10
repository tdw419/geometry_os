; DESCRIPTION: Composite: Sets a single yellow pixel at (422, 175) then Draws a yellow line from (109, 254) to (397, 113) then Creates a purple circular shape at (395, 212) with radius 31.
; PLAN: r0=422(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=254(y1), r7=397(x2), r8=113(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=212(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 109
LDI r6, 254
LDI r7, 397
LDI r8, 113
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 212
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
