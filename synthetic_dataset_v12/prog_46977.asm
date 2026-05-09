; DESCRIPTION: Composite: Places a orange line segment connecting (216, 157) to (21, 101) then Creates a green circular shape at (165, 96) with radius 57 then Renders a yellow box of size 59x77 starting at (178, 109).
; PLAN: r0=216(x1), r1=157(y1), r2=21(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=96(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=109(y), r12=59(width), r13=77(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 157
LDI r2, 21
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 96
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 109
LDI r12, 59
LDI r13, 77
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
