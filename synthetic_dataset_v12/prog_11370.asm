; DESCRIPTION: Composite: Sets a single purple pixel at (197, 85) then Renders a purple line between points (38, 148) and (266, 153) then Draws a black circle centered at (303, 110) with radius 60.
; PLAN: r0=197(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=38(x1), r6=148(y1), r7=266(x2), r8=153(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=110(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 148
LDI r7, 266
LDI r8, 153
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 110
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
