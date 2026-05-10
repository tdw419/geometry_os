; DESCRIPTION: Composite: Places a yellow line segment connecting (368, 162) to (222, 13) then Creates a blue rectangular region at (96, 65) spanning 58 by 90 pixels.
; PLAN: r0=368(x1), r1=162(y1), r2=222(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=65(y), r7=58(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 162
LDI r2, 222
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 65
LDI r7, 58
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
