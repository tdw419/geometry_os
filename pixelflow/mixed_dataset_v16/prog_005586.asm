; DESCRIPTION: Composite: Creates a white rectangular region at (52, 173) spanning 56 by 76 pixels then Renders a orange disk with center (442, 185) and radius 56 then Draws a purple line from (53, 201) to (482, 192).
; PLAN: r0=52(x), r1=173(y), r2=56(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=185(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=201(y1), r12=482(x2), r13=192(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 173
LDI r2, 56
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 185
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 201
LDI r12, 482
LDI r13, 192
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
