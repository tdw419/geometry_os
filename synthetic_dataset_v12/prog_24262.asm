; DESCRIPTION: Composite: Places a yellow circle of radius 30 at center (459, 35) then Draws a green line from (135, 9) to (213, 229) then Creates a green rectangular region at (10, 88) spanning 71 by 66 pixels.
; PLAN: r0=459(x), r1=35(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=9(y1), r7=213(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=88(y), r12=71(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 35
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 9
LDI r7, 213
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 88
LDI r12, 71
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
