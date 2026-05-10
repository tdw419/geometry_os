; DESCRIPTION: Composite: Draws a red line from (84, 101) to (10, 138) then Renders a green disk with center (289, 154) and radius 79 then Creates a white rectangular region at (306, 25) spanning 103 by 87 pixels.
; PLAN: r0=84(x1), r1=101(y1), r2=10(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=154(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=25(y), r12=103(width), r13=87(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 101
LDI r2, 10
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 154
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 25
LDI r12, 103
LDI r13, 87
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
