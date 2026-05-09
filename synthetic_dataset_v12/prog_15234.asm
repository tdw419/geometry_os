; DESCRIPTION: Composite: Creates a yellow circular shape at (336, 101) with radius 66 then Renders a purple box of size 91x116 starting at (166, 103) then Renders a green line between points (102, 20) and (395, 78).
; PLAN: r0=336(x), r1=101(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=103(y), r7=91(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x1), r11=20(y1), r12=395(x2), r13=78(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 101
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 103
LDI r7, 91
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 20
LDI r12, 395
LDI r13, 78
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
