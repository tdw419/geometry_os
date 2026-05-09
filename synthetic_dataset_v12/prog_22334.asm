; DESCRIPTION: Composite: Creates a purple rectangular region at (6, 97) spanning 10 by 27 pixels then Places a yellow line segment connecting (293, 137) to (277, 159) then Creates a magenta circular shape at (214, 175) with radius 32.
; PLAN: r0=6(x), r1=97(y), r2=10(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=137(y1), r7=277(x2), r8=159(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=175(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 97
LDI r2, 10
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 137
LDI r7, 277
LDI r8, 159
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 175
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
