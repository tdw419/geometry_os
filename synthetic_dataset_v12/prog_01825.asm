; DESCRIPTION: Composite: Creates a magenta circular shape at (109, 187) with radius 56 then Creates a red rectangular region at (382, 46) spanning 12 by 73 pixels then Renders a yellow line between points (181, 219) and (373, 59).
; PLAN: r0=109(x), r1=187(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=46(y), r7=12(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x1), r11=219(y1), r12=373(x2), r13=59(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 187
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 46
LDI r7, 12
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 219
LDI r12, 373
LDI r13, 59
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
