; DESCRIPTION: Composite: Draws a yellow line from (288, 68) to (129, 218) then Draws a blue circle centered at (449, 56) with radius 21 then Creates a red rectangular region at (50, 5) spanning 53 by 106 pixels.
; PLAN: r0=288(x1), r1=68(y1), r2=129(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=56(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x), r11=5(y), r12=53(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 68
LDI r2, 129
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 56
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 5
LDI r12, 53
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
