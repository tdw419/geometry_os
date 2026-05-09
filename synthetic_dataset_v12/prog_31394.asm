; DESCRIPTION: Composite: Renders a cyan line between points (392, 226) and (282, 218) then Creates a black rectangular region at (194, 134) spanning 47 by 75 pixels then Renders a black disk with center (371, 163) and radius 10.
; PLAN: r0=392(x1), r1=226(y1), r2=282(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=134(y), r7=47(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=163(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 226
LDI r2, 282
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 134
LDI r7, 47
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 163
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
