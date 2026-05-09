; DESCRIPTION: Composite: Draws a purple line from (242, 147) to (229, 59) then Renders a white disk with center (46, 160) and radius 38 then Creates a yellow rectangular region at (413, 75) spanning 23 by 47 pixels.
; PLAN: r0=242(x1), r1=147(y1), r2=229(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=160(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=75(y), r12=23(width), r13=47(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 147
LDI r2, 229
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 160
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 75
LDI r12, 23
LDI r13, 47
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
