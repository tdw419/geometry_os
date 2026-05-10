; DESCRIPTION: Composite: Draws a purple circle centered at (336, 159) with radius 70 then Places a yellow line segment connecting (207, 181) to (340, 118) then Places a purple dot at position (389, 240).
; PLAN: r0=336(x), r1=159(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=181(y1), r7=340(x2), r8=118(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=240(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 159
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 181
LDI r7, 340
LDI r8, 118
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 240
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
