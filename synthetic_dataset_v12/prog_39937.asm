; DESCRIPTION: Composite: Draws a yellow circle centered at (223, 68) with radius 57 then Places a white dot at position (118, 100) then Places a purple line segment connecting (442, 145) to (488, 172).
; PLAN: r0=223(x), r1=68(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x1), r11=145(y1), r12=488(x2), r13=172(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 68
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 145
LDI r12, 488
LDI r13, 172
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
