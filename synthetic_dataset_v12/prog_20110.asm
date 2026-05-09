; DESCRIPTION: Composite: Draws a yellow line from (275, 142) to (268, 119) then Creates a purple circular shape at (131, 108) with radius 21 then Draws a magenta rectangle at (357, 89) with width 53 and height 17.
; PLAN: r0=275(x1), r1=142(y1), r2=268(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=108(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=89(y), r12=53(width), r13=17(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 142
LDI r2, 268
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 108
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 89
LDI r12, 53
LDI r13, 17
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
