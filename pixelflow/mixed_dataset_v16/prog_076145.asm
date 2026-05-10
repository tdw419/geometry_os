; DESCRIPTION: Composite: Renders a blue line between points (173, 58) and (272, 70) then Places a orange circle of radius 66 at center (221, 109) then Places a blue 111x110 rectangle at position (183, 109).
; PLAN: r0=173(x1), r1=58(y1), r2=272(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=109(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=109(y), r12=111(width), r13=110(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 58
LDI r2, 272
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 109
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 109
LDI r12, 111
LDI r13, 110
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
