; DESCRIPTION: Composite: Draws a purple line from (158, 107) to (56, 169) then Places a green 23x71 rectangle at position (238, 127) then Places a white circle of radius 73 at center (201, 109).
; PLAN: r0=158(x1), r1=107(y1), r2=56(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=127(y), r7=23(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=109(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 107
LDI r2, 56
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 127
LDI r7, 23
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 109
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
