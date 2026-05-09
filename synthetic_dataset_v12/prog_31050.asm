; DESCRIPTION: Composite: Sets a single red pixel at (430, 72) then Places a purple line segment connecting (452, 250) to (286, 250) then Draws a yellow circle centered at (386, 134) with radius 65.
; PLAN: r0=430(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=250(y1), r7=286(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=134(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 452
LDI r6, 250
LDI r7, 286
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 134
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
