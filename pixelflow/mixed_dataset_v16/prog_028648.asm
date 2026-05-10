; DESCRIPTION: Composite: Renders a blue disk with center (357, 150) and radius 66 then Creates a black rectangular region at (27, 23) spanning 58 by 95 pixels then Renders a black line between points (510, 193) and (333, 12).
; PLAN: r0=357(x), r1=150(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=23(y), r7=58(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=510(x1), r11=193(y1), r12=333(x2), r13=12(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 150
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 23
LDI r7, 58
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 193
LDI r12, 333
LDI r13, 12
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
