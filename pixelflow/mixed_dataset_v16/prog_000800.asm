; DESCRIPTION: Composite: Draws a purple line from (482, 237) to (358, 196) then Renders a orange disk with center (276, 140) and radius 75 then Creates a white rectangular region at (60, 125) spanning 78 by 68 pixels.
; PLAN: r0=482(x1), r1=237(y1), r2=358(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=140(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=125(y), r12=78(width), r13=68(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 237
LDI r2, 358
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 140
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 125
LDI r12, 78
LDI r13, 68
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
