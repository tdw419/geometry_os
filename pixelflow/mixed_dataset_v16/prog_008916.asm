; DESCRIPTION: Composite: Renders a orange disk with center (347, 80) and radius 71 then Creates a cyan rectangular region at (181, 180) spanning 90 by 63 pixels then Renders a purple line between points (12, 138) and (74, 129).
; PLAN: r0=347(x), r1=80(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=180(y), r7=90(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x1), r11=138(y1), r12=74(x2), r13=129(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 80
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 180
LDI r7, 90
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 138
LDI r12, 74
LDI r13, 129
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
