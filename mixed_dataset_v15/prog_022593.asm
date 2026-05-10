; DESCRIPTION: Composite: Renders a purple box of size 40x37 starting at (316, 155) then Renders a white disk with center (459, 38) and radius 29 then Renders a green line between points (268, 166) and (84, 76).
; PLAN: r0=316(x), r1=155(y), r2=40(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=38(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=166(y1), r12=84(x2), r13=76(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 155
LDI r2, 40
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 38
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 166
LDI r12, 84
LDI r13, 76
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
