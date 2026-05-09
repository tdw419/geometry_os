; DESCRIPTION: Composite: Draws a magenta line from (383, 125) to (265, 21) then Places a white circle of radius 42 at center (205, 121) then Creates a yellow rectangular region at (312, 56) spanning 119 by 64 pixels.
; PLAN: r0=383(x1), r1=125(y1), r2=265(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=121(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=56(y), r12=119(width), r13=64(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 125
LDI r2, 265
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 121
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 56
LDI r12, 119
LDI r13, 64
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
