; DESCRIPTION: Composite: Sets a single blue pixel at (30, 217) then Renders a orange disk with center (81, 174) and radius 70 then Places a white line segment connecting (117, 138) to (378, 227).
; PLAN: r0=30(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=174(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x1), r11=138(y1), r12=378(x2), r13=227(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 174
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 138
LDI r12, 378
LDI r13, 227
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
