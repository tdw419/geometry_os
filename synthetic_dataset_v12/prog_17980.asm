; DESCRIPTION: Composite: Renders a white box of size 40x96 starting at (435, 25) then Draws a red circle centered at (51, 201) with radius 51 then Renders a red line between points (185, 12) and (373, 163).
; PLAN: r0=435(x), r1=25(y), r2=40(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=201(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x1), r11=12(y1), r12=373(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 25
LDI r2, 40
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 201
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 12
LDI r12, 373
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
