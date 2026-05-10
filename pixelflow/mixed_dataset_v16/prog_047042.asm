; DESCRIPTION: Composite: Places a green line segment connecting (431, 203) to (430, 6) then Sets a single black pixel at (138, 243) then Draws a blue circle centered at (268, 48) with radius 22.
; PLAN: r0=431(x1), r1=203(y1), r2=430(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=243(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=268(x), r11=48(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 203
LDI r2, 430
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 243
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 268
LDI r11, 48
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
