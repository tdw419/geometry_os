; DESCRIPTION: Composite: Creates a magenta circular shape at (349, 45) with radius 23 then Places a black line segment connecting (276, 183) to (496, 99) then Creates a blue rectangular region at (87, 47) spanning 92 by 57 pixels.
; PLAN: r0=349(x), r1=45(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=183(y1), r7=496(x2), r8=99(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=47(y), r12=92(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 45
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 183
LDI r7, 496
LDI r8, 99
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 47
LDI r12, 92
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
