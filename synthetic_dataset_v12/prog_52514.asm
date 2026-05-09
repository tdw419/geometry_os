; DESCRIPTION: Composite: Draws a yellow circle centered at (108, 107) with radius 73 then Creates a magenta rectangular region at (212, 93) spanning 31 by 115 pixels then Places a purple line segment connecting (127, 223) to (84, 138).
; PLAN: r0=108(x), r1=107(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=93(y), r7=31(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=223(y1), r12=84(x2), r13=138(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 107
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 93
LDI r7, 31
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 223
LDI r12, 84
LDI r13, 138
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
