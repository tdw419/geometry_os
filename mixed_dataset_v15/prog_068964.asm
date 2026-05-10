; DESCRIPTION: Composite: Creates a red circular shape at (109, 163) with radius 24 then Draws a blue line from (306, 134) to (484, 17) then Creates a blue rectangular region at (79, 12) spanning 86 by 57 pixels.
; PLAN: r0=109(x), r1=163(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=134(y1), r7=484(x2), r8=17(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=12(y), r12=86(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 163
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 134
LDI r7, 484
LDI r8, 17
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 12
LDI r12, 86
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
