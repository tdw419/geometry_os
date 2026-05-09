; DESCRIPTION: Composite: Places a orange line segment connecting (152, 107) to (426, 186) then Sets a single yellow pixel at (25, 71) then Draws a yellow circle centered at (463, 129) with radius 49.
; PLAN: r0=152(x1), r1=107(y1), r2=426(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=71(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=463(x), r11=129(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 107
LDI r2, 426
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 71
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 463
LDI r11, 129
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
