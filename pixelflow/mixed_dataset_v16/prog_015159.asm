; DESCRIPTION: Composite: Sets a single green pixel at (40, 234) then Draws a black line from (232, 203) to (232, 9) then Draws a blue circle centered at (229, 107) with radius 24.
; PLAN: r0=40(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=203(y1), r7=232(x2), r8=9(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=107(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 234
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 232
LDI r6, 203
LDI r7, 232
LDI r8, 9
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 107
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
