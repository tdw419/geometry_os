; DESCRIPTION: Composite: Draws a purple line from (147, 133) to (335, 206) then Renders a red disk with center (188, 112) and radius 80 then Renders a green box of size 68x107 starting at (437, 107).
; PLAN: r0=147(x1), r1=133(y1), r2=335(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=112(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x), r11=107(y), r12=68(width), r13=107(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 133
LDI r2, 335
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 112
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 107
LDI r12, 68
LDI r13, 107
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
