; DESCRIPTION: Composite: Renders a yellow box of size 71x107 starting at (26, 145) then Places a blue line segment connecting (269, 200) to (447, 160) then Creates a cyan circular shape at (454, 175) with radius 29.
; PLAN: r0=26(x), r1=145(y), r2=71(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x1), r6=200(y1), r7=447(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=175(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 145
LDI r2, 71
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 200
LDI r7, 447
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 175
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
