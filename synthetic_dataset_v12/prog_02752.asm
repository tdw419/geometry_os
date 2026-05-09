; DESCRIPTION: Composite: Creates a red rectangular region at (188, 36) spanning 34 by 116 pixels then Draws a purple line from (335, 90) to (381, 90) then Renders a orange disk with center (443, 148) and radius 69.
; PLAN: r0=188(x), r1=36(y), r2=34(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=90(y1), r7=381(x2), r8=90(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=148(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 36
LDI r2, 34
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 90
LDI r7, 381
LDI r8, 90
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 148
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
