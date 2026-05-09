; DESCRIPTION: Composite: Sets a single magenta pixel at (122, 65) then Places a magenta line segment connecting (466, 35) to (16, 145) then Draws a red circle centered at (47, 156) with radius 46.
; PLAN: r0=122(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=35(y1), r7=16(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=156(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 35
LDI r7, 16
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 156
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
