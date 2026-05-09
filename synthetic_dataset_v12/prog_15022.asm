; DESCRIPTION: Composite: Places a yellow line segment connecting (465, 109) to (325, 119) then Renders a magenta box of size 72x51 starting at (119, 4) then Creates a yellow circular shape at (419, 83) with radius 65.
; PLAN: r0=465(x1), r1=109(y1), r2=325(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=4(y), r7=72(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=83(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 109
LDI r2, 325
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 4
LDI r7, 72
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 83
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
