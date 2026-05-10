; DESCRIPTION: Composite: Renders a red disk with center (359, 72) and radius 53 then Creates a blue rectangular region at (466, 44) spanning 45 by 18 pixels then Renders a black line between points (403, 37) and (87, 158).
; PLAN: r0=359(x), r1=72(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=44(y), r7=45(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=403(x1), r11=37(y1), r12=87(x2), r13=158(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 72
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 44
LDI r7, 45
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 37
LDI r12, 87
LDI r13, 158
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
