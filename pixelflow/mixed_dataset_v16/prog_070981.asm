; DESCRIPTION: Composite: Places a black 111x47 rectangle at position (88, 71) then Creates a yellow circular shape at (62, 175) with radius 32 then Places a magenta line segment connecting (314, 70) to (39, 18).
; PLAN: r0=88(x), r1=71(y), r2=111(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=175(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x1), r11=70(y1), r12=39(x2), r13=18(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 71
LDI r2, 111
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 175
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 70
LDI r12, 39
LDI r13, 18
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
