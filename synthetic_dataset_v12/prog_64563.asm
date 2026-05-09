; DESCRIPTION: Composite: Places a red line segment connecting (442, 12) to (465, 254) then Draws a yellow circle centered at (373, 186) with radius 52 then Creates a green rectangular region at (125, 140) spanning 102 by 58 pixels.
; PLAN: r0=442(x1), r1=12(y1), r2=465(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=186(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=140(y), r12=102(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 12
LDI r2, 465
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 186
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 140
LDI r12, 102
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
