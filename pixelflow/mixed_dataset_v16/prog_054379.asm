; DESCRIPTION: Composite: Renders a yellow line between points (462, 160) and (273, 92) then Renders a white box of size 96x112 starting at (264, 135) then Draws a white circle centered at (466, 208) with radius 13.
; PLAN: r0=462(x1), r1=160(y1), r2=273(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=135(y), r7=96(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=208(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 160
LDI r2, 273
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 135
LDI r7, 96
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 208
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
