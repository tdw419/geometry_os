; DESCRIPTION: Composite: Renders a yellow disk with center (138, 123) and radius 67 then Renders a black box of size 101x16 starting at (16, 153) then Places a green line segment connecting (250, 56) to (335, 24).
; PLAN: r0=138(x), r1=123(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=153(y), r7=101(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x1), r11=56(y1), r12=335(x2), r13=24(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 123
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 153
LDI r7, 101
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 56
LDI r12, 335
LDI r13, 24
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
