; DESCRIPTION: Composite: Renders a yellow line between points (133, 148) and (19, 190) then Creates a red circular shape at (438, 146) with radius 43 then Creates a orange rectangular region at (292, 169) spanning 101 by 17 pixels.
; PLAN: r0=133(x1), r1=148(y1), r2=19(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=146(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=169(y), r12=101(width), r13=17(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 148
LDI r2, 19
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 146
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 169
LDI r12, 101
LDI r13, 17
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
