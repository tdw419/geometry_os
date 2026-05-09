; DESCRIPTION: Composite: Places a black line segment connecting (267, 47) to (372, 178) then Renders a yellow disk with center (180, 201) and radius 55 then Creates a blue rectangular region at (125, 41) spanning 105 by 52 pixels.
; PLAN: r0=267(x1), r1=47(y1), r2=372(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=201(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=41(y), r12=105(width), r13=52(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 47
LDI r2, 372
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 201
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 41
LDI r12, 105
LDI r13, 52
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
