; DESCRIPTION: Composite: Places a blue line segment connecting (489, 78) to (196, 169) then Places a cyan circle of radius 27 at center (106, 136) then Creates a black rectangular region at (145, 127) spanning 46 by 42 pixels.
; PLAN: r0=489(x1), r1=78(y1), r2=196(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=136(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=127(y), r12=46(width), r13=42(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 78
LDI r2, 196
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 136
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 127
LDI r12, 46
LDI r13, 42
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
