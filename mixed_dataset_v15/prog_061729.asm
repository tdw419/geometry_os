; DESCRIPTION: Composite: Draws a orange circle centered at (235, 48) with radius 37 then Places a cyan line segment connecting (441, 145) to (293, 101) then Places a white 81x35 rectangle at position (18, 147).
; PLAN: r0=235(x), r1=48(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=145(y1), r7=293(x2), r8=101(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=147(y), r12=81(width), r13=35(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 48
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 145
LDI r7, 293
LDI r8, 101
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 147
LDI r12, 81
LDI r13, 35
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
