; DESCRIPTION: Composite: Renders a magenta disk with center (328, 77) and radius 33 then Creates a green rectangular region at (358, 152) spanning 94 by 77 pixels then Draws a blue line from (107, 142) to (468, 80).
; PLAN: r0=328(x), r1=77(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=152(y), r7=94(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=142(y1), r12=468(x2), r13=80(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 77
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 152
LDI r7, 94
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 142
LDI r12, 468
LDI r13, 80
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
