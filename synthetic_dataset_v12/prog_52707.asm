; DESCRIPTION: Composite: Draws a black line from (206, 202) to (429, 128) then Creates a black rectangular region at (143, 130) spanning 23 by 28 pixels then Draws a white circle centered at (131, 216) with radius 13.
; PLAN: r0=206(x1), r1=202(y1), r2=429(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=130(y), r7=23(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x), r11=216(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 202
LDI r2, 429
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 130
LDI r7, 23
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 216
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
