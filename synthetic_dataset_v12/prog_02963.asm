; DESCRIPTION: Composite: Renders a magenta line between points (208, 132) and (215, 42) then Creates a blue circular shape at (135, 198) with radius 58 then Creates a black rectangular region at (335, 91) spanning 41 by 75 pixels.
; PLAN: r0=208(x1), r1=132(y1), r2=215(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=198(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=91(y), r12=41(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 132
LDI r2, 215
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 198
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 91
LDI r12, 41
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
