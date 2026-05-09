; DESCRIPTION: Composite: Creates a green circular shape at (105, 155) with radius 33 then Renders a magenta line between points (270, 174) and (95, 237) then Renders a blue box of size 83x10 starting at (169, 4).
; PLAN: r0=105(x), r1=155(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x1), r6=174(y1), r7=95(x2), r8=237(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=4(y), r12=83(width), r13=10(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 155
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 174
LDI r7, 95
LDI r8, 237
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 4
LDI r12, 83
LDI r13, 10
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
