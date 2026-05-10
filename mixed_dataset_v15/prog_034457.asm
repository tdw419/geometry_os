; DESCRIPTION: Composite: Places a blue line segment connecting (104, 238) to (147, 154) then Creates a purple circular shape at (139, 77) with radius 74 then Renders a yellow box of size 16x27 starting at (121, 91).
; PLAN: r0=104(x1), r1=238(y1), r2=147(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=77(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x), r11=91(y), r12=16(width), r13=27(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 238
LDI r2, 147
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 77
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 91
LDI r12, 16
LDI r13, 27
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
