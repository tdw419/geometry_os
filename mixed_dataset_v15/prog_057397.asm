; DESCRIPTION: Composite: Places a black 36x54 rectangle at position (437, 142) then Renders a purple disk with center (233, 198) and radius 53 then Places a black line segment connecting (216, 235) to (123, 62).
; PLAN: r0=437(x), r1=142(y), r2=36(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=198(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x1), r11=235(y1), r12=123(x2), r13=62(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 142
LDI r2, 36
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 198
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 235
LDI r12, 123
LDI r13, 62
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
