; DESCRIPTION: Composite: Creates a black rectangular region at (371, 195) spanning 53 by 56 pixels then Creates a blue circular shape at (20, 75) with radius 16 then Draws a red line from (254, 112) to (127, 203).
; PLAN: r0=371(x), r1=195(y), r2=53(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=75(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x1), r11=112(y1), r12=127(x2), r13=203(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 195
LDI r2, 53
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 75
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 112
LDI r12, 127
LDI r13, 203
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
