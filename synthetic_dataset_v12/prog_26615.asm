; DESCRIPTION: Composite: Renders a purple disk with center (176, 216) and radius 37 then Renders a green box of size 56x119 starting at (47, 44) then Draws a white line from (464, 202) to (217, 201).
; PLAN: r0=176(x), r1=216(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=44(y), r7=56(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x1), r11=202(y1), r12=217(x2), r13=201(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 216
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 44
LDI r7, 56
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 202
LDI r12, 217
LDI r13, 201
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
