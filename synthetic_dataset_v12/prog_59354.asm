; DESCRIPTION: Composite: Renders a white disk with center (93, 118) and radius 24 then Places a white dot at position (105, 199) then Places a blue line segment connecting (416, 7) to (31, 8).
; PLAN: r0=93(x), r1=118(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=199(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=416(x1), r11=7(y1), r12=31(x2), r13=8(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 118
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 199
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 416
LDI r11, 7
LDI r12, 31
LDI r13, 8
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
