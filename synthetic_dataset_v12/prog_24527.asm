; DESCRIPTION: Composite: Places a green dot at position (336, 240) then Creates a green circular shape at (416, 130) with radius 22 then Renders a orange line between points (199, 54) and (40, 106).
; PLAN: r0=336(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=130(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x1), r11=54(y1), r12=40(x2), r13=106(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 240
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 416
LDI r6, 130
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 54
LDI r12, 40
LDI r13, 106
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
