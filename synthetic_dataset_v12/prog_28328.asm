; DESCRIPTION: Composite: Draws a orange rectangle at (347, 39) with width 68 and height 115 then Creates a cyan circular shape at (212, 129) with radius 55 then Draws a black line from (440, 201) to (226, 0).
; PLAN: r0=347(x), r1=39(y), r2=68(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x), r6=129(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x1), r11=201(y1), r12=226(x2), r13=0(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 39
LDI r2, 68
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 129
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 201
LDI r12, 226
LDI r13, 0
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
