; DESCRIPTION: Composite: Draws a magenta line from (9, 8) to (318, 93) then Draws a magenta rectangle at (142, 201) with width 14 and height 42 then Creates a black circular shape at (182, 61) with radius 44.
; PLAN: r0=9(x1), r1=8(y1), r2=318(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=201(y), r7=14(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=61(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 8
LDI r2, 318
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 201
LDI r7, 14
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 61
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
