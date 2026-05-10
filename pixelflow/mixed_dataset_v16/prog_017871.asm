; DESCRIPTION: Composite: Creates a green rectangular region at (268, 198) spanning 16 by 37 pixels then Renders a purple disk with center (213, 80) and radius 45 then Places a magenta line segment connecting (76, 109) to (405, 77).
; PLAN: r0=268(x), r1=198(y), r2=16(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=80(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x1), r11=109(y1), r12=405(x2), r13=77(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 198
LDI r2, 16
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 80
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 109
LDI r12, 405
LDI r13, 77
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
