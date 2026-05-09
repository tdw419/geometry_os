; DESCRIPTION: Composite: Draws a orange line from (84, 164) to (112, 129) then Draws a red circle centered at (254, 109) with radius 77 then Creates a magenta rectangular region at (323, 1) spanning 28 by 104 pixels.
; PLAN: r0=84(x1), r1=164(y1), r2=112(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=109(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x), r11=1(y), r12=28(width), r13=104(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 164
LDI r2, 112
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 109
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 1
LDI r12, 28
LDI r13, 104
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
