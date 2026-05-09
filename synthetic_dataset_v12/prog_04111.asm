; DESCRIPTION: Composite: Sets a single yellow pixel at (314, 77) then Creates a magenta circular shape at (410, 179) with radius 61 then Draws a black line from (9, 149) to (254, 200).
; PLAN: r0=314(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=179(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=9(x1), r11=149(y1), r12=254(x2), r13=200(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 179
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 9
LDI r11, 149
LDI r12, 254
LDI r13, 200
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
