; DESCRIPTION: Composite: Renders a cyan box of size 39x106 starting at (40, 48) then Places a purple line segment connecting (470, 242) to (52, 87) then Creates a yellow circular shape at (288, 79) with radius 70.
; PLAN: r0=40(x), r1=48(y), r2=39(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=242(y1), r7=52(x2), r8=87(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=79(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 48
LDI r2, 39
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 242
LDI r7, 52
LDI r8, 87
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 79
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
