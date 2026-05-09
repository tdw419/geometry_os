; DESCRIPTION: Composite: Places a yellow 89x35 rectangle at position (299, 71) then Renders a blue line between points (19, 147) and (246, 246) then Creates a red circular shape at (260, 99) with radius 69.
; PLAN: r0=299(x), r1=71(y), r2=89(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=147(y1), r7=246(x2), r8=246(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=99(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 71
LDI r2, 89
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 147
LDI r7, 246
LDI r8, 246
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 99
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
