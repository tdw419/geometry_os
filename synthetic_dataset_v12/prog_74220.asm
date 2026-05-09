; DESCRIPTION: Composite: Creates a yellow rectangular region at (43, 24) spanning 105 by 104 pixels then Renders a green disk with center (460, 204) and radius 44 then Places a green line segment connecting (312, 212) to (46, 2).
; PLAN: r0=43(x), r1=24(y), r2=105(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=204(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x1), r11=212(y1), r12=46(x2), r13=2(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 24
LDI r2, 105
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 204
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 212
LDI r12, 46
LDI r13, 2
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
