; DESCRIPTION: Composite: Creates a magenta circular shape at (58, 169) with radius 32 then Creates a red rectangular region at (182, 35) spanning 114 by 40 pixels then Renders a orange line between points (445, 144) and (166, 28).
; PLAN: r0=58(x), r1=169(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=35(y), r7=114(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x1), r11=144(y1), r12=166(x2), r13=28(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 169
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 35
LDI r7, 114
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 144
LDI r12, 166
LDI r13, 28
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
