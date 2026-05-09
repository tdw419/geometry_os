; DESCRIPTION: Composite: Creates a purple circular shape at (362, 117) with radius 80 then Creates a white rectangular region at (165, 117) spanning 112 by 39 pixels then Draws a magenta line from (231, 106) to (64, 46).
; PLAN: r0=362(x), r1=117(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=117(y), r7=112(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x1), r11=106(y1), r12=64(x2), r13=46(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 117
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 117
LDI r7, 112
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 106
LDI r12, 64
LDI r13, 46
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
