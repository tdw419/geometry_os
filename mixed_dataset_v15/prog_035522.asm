; DESCRIPTION: Composite: Draws a yellow circle centered at (217, 171) with radius 66 then Places a white dot at position (216, 5) then Places a blue line segment connecting (59, 193) to (396, 130).
; PLAN: r0=217(x), r1=171(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=5(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=59(x1), r11=193(y1), r12=396(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 171
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 5
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 59
LDI r11, 193
LDI r12, 396
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
