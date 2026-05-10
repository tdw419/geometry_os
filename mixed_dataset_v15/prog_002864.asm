; DESCRIPTION: Composite: Creates a magenta rectangular region at (442, 145) spanning 53 by 37 pixels then Draws a black circle centered at (383, 53) with radius 52 then Places a white line segment connecting (449, 236) to (385, 226).
; PLAN: r0=442(x), r1=145(y), r2=53(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=53(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=449(x1), r11=236(y1), r12=385(x2), r13=226(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 145
LDI r2, 53
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 53
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 449
LDI r11, 236
LDI r12, 385
LDI r13, 226
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
