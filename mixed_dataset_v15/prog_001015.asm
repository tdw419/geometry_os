; DESCRIPTION: Composite: Renders a white disk with center (440, 183) and radius 25 then Creates a red rectangular region at (198, 21) spanning 17 by 96 pixels then Places a yellow line segment connecting (440, 143) to (492, 127).
; PLAN: r0=440(x), r1=183(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=21(y), r7=17(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x1), r11=143(y1), r12=492(x2), r13=127(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 183
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 21
LDI r7, 17
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 143
LDI r12, 492
LDI r13, 127
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
