; DESCRIPTION: Composite: Sets a single orange pixel at (235, 104) then Draws a green circle centered at (167, 155) with radius 54 then Renders a white line between points (312, 17) and (407, 144).
; PLAN: r0=235(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=155(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x1), r11=17(y1), r12=407(x2), r13=144(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 167
LDI r6, 155
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 17
LDI r12, 407
LDI r13, 144
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
