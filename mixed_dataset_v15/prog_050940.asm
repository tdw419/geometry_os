; DESCRIPTION: Composite: Places a orange 29x13 rectangle at position (350, 223) then Renders a black line between points (37, 190) and (469, 69) then Creates a purple circular shape at (299, 112) with radius 60.
; PLAN: r0=350(x), r1=223(y), r2=29(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=190(y1), r7=469(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=112(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 223
LDI r2, 29
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 190
LDI r7, 469
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 112
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
