; DESCRIPTION: Composite: Renders a yellow disk with center (58, 138) and radius 28 then Renders a magenta line between points (301, 67) and (283, 38) then Creates a purple rectangular region at (70, 80) spanning 88 by 34 pixels.
; PLAN: r0=58(x), r1=138(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=67(y1), r7=283(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=80(y), r12=88(width), r13=34(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 138
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 67
LDI r7, 283
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 80
LDI r12, 88
LDI r13, 34
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
