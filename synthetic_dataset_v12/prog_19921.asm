; DESCRIPTION: Composite: Renders a purple line between points (243, 8) and (123, 48) then Sets a single cyan pixel at (165, 88) then Creates a black circular shape at (192, 183) with radius 18.
; PLAN: r0=243(x1), r1=8(y1), r2=123(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=183(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 8
LDI r2, 123
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 192
LDI r11, 183
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
