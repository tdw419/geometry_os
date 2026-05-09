; DESCRIPTION: Composite: Creates a green rectangular region at (8, 30) spanning 21 by 90 pixels then Places a magenta circle of radius 33 at center (258, 191) then Renders a yellow line between points (129, 37) and (270, 101).
; PLAN: r0=8(x), r1=30(y), r2=21(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=191(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x1), r11=37(y1), r12=270(x2), r13=101(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 30
LDI r2, 21
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 191
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 37
LDI r12, 270
LDI r13, 101
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
