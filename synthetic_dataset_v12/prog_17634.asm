; DESCRIPTION: Composite: Sets a single magenta pixel at (337, 198) then Renders a magenta line between points (427, 110) and (313, 138) then Creates a yellow circular shape at (141, 113) with radius 60.
; PLAN: r0=337(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=110(y1), r7=313(x2), r8=138(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=113(y), r12=60(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 110
LDI r7, 313
LDI r8, 138
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 113
LDI r12, 60
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
