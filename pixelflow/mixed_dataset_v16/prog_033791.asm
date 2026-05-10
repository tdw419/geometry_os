; DESCRIPTION: Composite: Creates a orange rectangular region at (203, 47) spanning 48 by 115 pixels then Draws a red line from (227, 149) to (19, 153) then Renders a yellow disk with center (382, 114) and radius 68.
; PLAN: r0=203(x), r1=47(y), r2=48(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=149(y1), r7=19(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=114(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 47
LDI r2, 48
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 149
LDI r7, 19
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 114
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
