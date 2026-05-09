; DESCRIPTION: Composite: Creates a purple circular shape at (293, 144) with radius 79 then Creates a magenta rectangular region at (46, 104) spanning 81 by 41 pixels then Places a yellow line segment connecting (90, 231) to (401, 13).
; PLAN: r0=293(x), r1=144(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=104(y), r7=81(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x1), r11=231(y1), r12=401(x2), r13=13(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 144
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 104
LDI r7, 81
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 231
LDI r12, 401
LDI r13, 13
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
