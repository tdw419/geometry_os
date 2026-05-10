; DESCRIPTION: Composite: Renders a black disk with center (371, 133) and radius 69 then Creates a green rectangular region at (428, 130) spanning 75 by 103 pixels then Renders a purple line between points (404, 65) and (191, 210).
; PLAN: r0=371(x), r1=133(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=130(y), r7=75(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x1), r11=65(y1), r12=191(x2), r13=210(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 133
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 130
LDI r7, 75
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 65
LDI r12, 191
LDI r13, 210
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
