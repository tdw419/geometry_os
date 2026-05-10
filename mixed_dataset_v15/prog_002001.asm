; DESCRIPTION: Composite: Places a red circle of radius 44 at center (179, 200) then Renders a purple box of size 20x119 starting at (418, 62) then Renders a green line between points (5, 151) and (97, 2).
; PLAN: r0=179(x), r1=200(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=62(y), r7=20(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x1), r11=151(y1), r12=97(x2), r13=2(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 200
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 62
LDI r7, 20
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 151
LDI r12, 97
LDI r13, 2
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
