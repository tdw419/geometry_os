; DESCRIPTION: Composite: Draws a purple line from (345, 129) to (256, 96) then Creates a magenta rectangular region at (182, 80) spanning 53 by 97 pixels then Renders a magenta disk with center (296, 174) and radius 76.
; PLAN: r0=345(x1), r1=129(y1), r2=256(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=80(y), r7=53(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=174(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 129
LDI r2, 256
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 80
LDI r7, 53
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 174
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
