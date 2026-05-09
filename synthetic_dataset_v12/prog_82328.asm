; DESCRIPTION: Composite: Places a magenta circle of radius 60 at center (447, 192) then Creates a yellow rectangular region at (229, 51) spanning 106 by 84 pixels then Places a white line segment connecting (380, 199) to (81, 231).
; PLAN: r0=447(x), r1=192(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=51(y), r7=106(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=380(x1), r11=199(y1), r12=81(x2), r13=231(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 192
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 51
LDI r7, 106
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 199
LDI r12, 81
LDI r13, 231
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
