; DESCRIPTION: Composite: Places a yellow dot at position (116, 173) then Places a white line segment connecting (493, 130) to (105, 112) then Draws a purple circle centered at (431, 149) with radius 80.
; PLAN: r0=116(x), r1=173(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=130(y1), r7=105(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=149(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 173
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 493
LDI r6, 130
LDI r7, 105
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 149
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
