; DESCRIPTION: Composite: Draws a black circle centered at (478, 34) with radius 20 then Renders a yellow line between points (478, 75) and (152, 14) then Renders a blue box of size 30x78 starting at (297, 157).
; PLAN: r0=478(x), r1=34(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=75(y1), r7=152(x2), r8=14(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=157(y), r12=30(width), r13=78(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 34
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 75
LDI r7, 152
LDI r8, 14
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 157
LDI r12, 30
LDI r13, 78
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
