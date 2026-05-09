; DESCRIPTION: Composite: Places a blue line segment connecting (246, 179) to (435, 227) then Renders a purple disk with center (455, 97) and radius 48 then Places a white 75x102 rectangle at position (112, 123).
; PLAN: r0=246(x1), r1=179(y1), r2=435(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=97(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x), r11=123(y), r12=75(width), r13=102(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 179
LDI r2, 435
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 97
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 123
LDI r12, 75
LDI r13, 102
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
