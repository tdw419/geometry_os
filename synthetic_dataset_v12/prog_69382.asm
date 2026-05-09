; DESCRIPTION: Composite: Draws a blue line from (49, 123) to (354, 22) then Creates a red circular shape at (142, 59) with radius 57 then Renders a yellow box of size 26x18 starting at (0, 216).
; PLAN: r0=49(x1), r1=123(y1), r2=354(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=59(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=216(y), r12=26(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 123
LDI r2, 354
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 59
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 216
LDI r12, 26
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
