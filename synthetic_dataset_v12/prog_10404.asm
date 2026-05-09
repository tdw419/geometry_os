; DESCRIPTION: Composite: Renders a black disk with center (86, 52) and radius 51 then Places a black line segment connecting (504, 150) to (261, 71) then Creates a green rectangular region at (345, 125) spanning 36 by 90 pixels.
; PLAN: r0=86(x), r1=52(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x1), r6=150(y1), r7=261(x2), r8=71(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=125(y), r12=36(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 52
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 150
LDI r7, 261
LDI r8, 71
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 125
LDI r12, 36
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
