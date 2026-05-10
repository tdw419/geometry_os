; DESCRIPTION: Composite: Places a magenta line segment connecting (178, 51) to (356, 164) then Draws a yellow circle centered at (322, 34) with radius 28 then Creates a green rectangular region at (316, 177) spanning 38 by 49 pixels.
; PLAN: r0=178(x1), r1=51(y1), r2=356(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=34(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=177(y), r12=38(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 51
LDI r2, 356
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 34
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 177
LDI r12, 38
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
