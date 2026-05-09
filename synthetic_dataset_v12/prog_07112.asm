; DESCRIPTION: Composite: Renders a red line between points (353, 162) and (149, 159) then Renders a red box of size 15x78 starting at (345, 48) then Renders a purple disk with center (374, 179) and radius 34.
; PLAN: r0=353(x1), r1=162(y1), r2=149(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=48(y), r7=15(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=179(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 162
LDI r2, 149
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 48
LDI r7, 15
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 179
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
