; DESCRIPTION: Composite: Sets a single blue pixel at (151, 196) then Creates a yellow rectangular region at (22, 44) spanning 99 by 104 pixels then Draws a orange line from (27, 175) to (63, 108).
; PLAN: r0=151(x), r1=196(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=44(y), r7=99(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=27(x1), r11=175(y1), r12=63(x2), r13=108(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 196
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 22
LDI r6, 44
LDI r7, 99
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 175
LDI r12, 63
LDI r13, 108
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
