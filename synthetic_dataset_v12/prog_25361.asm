; DESCRIPTION: Composite: Places a orange dot at position (375, 22) then Places a magenta circle of radius 27 at center (112, 142) then Draws a red line from (135, 58) to (351, 145).
; PLAN: r0=375(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=142(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x1), r11=58(y1), r12=351(x2), r13=145(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 112
LDI r6, 142
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 58
LDI r12, 351
LDI r13, 145
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
