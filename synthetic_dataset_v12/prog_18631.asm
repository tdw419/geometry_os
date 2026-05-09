; DESCRIPTION: Composite: Renders a purple line between points (47, 45) and (155, 102) then Places a yellow 40x96 rectangle at position (428, 75) then Places a cyan circle of radius 80 at center (253, 148).
; PLAN: r0=47(x1), r1=45(y1), r2=155(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=75(y), r7=40(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=148(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 45
LDI r2, 155
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 75
LDI r7, 40
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 148
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
