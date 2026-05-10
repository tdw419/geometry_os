; DESCRIPTION: Composite: Renders a magenta box of size 117x83 starting at (7, 39) then Renders a magenta line between points (373, 48) and (444, 232) then Creates a yellow circular shape at (448, 202) with radius 44.
; PLAN: r0=7(x), r1=39(y), r2=117(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x1), r6=48(y1), r7=444(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=202(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 39
LDI r2, 117
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 48
LDI r7, 444
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 202
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
