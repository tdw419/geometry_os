; DESCRIPTION: Composite: Renders a yellow disk with center (80, 79) and radius 44 then Creates a red rectangular region at (85, 172) spanning 51 by 42 pixels then Renders a red line between points (469, 198) and (45, 125).
; PLAN: r0=80(x), r1=79(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=172(y), r7=51(width), r8=42(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x1), r11=198(y1), r12=45(x2), r13=125(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 79
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 172
LDI r7, 51
LDI r8, 42
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 198
LDI r12, 45
LDI r13, 125
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
