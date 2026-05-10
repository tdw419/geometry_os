; DESCRIPTION: Composite: Draws a orange circle centered at (428, 103) with radius 69 then Places a red line segment connecting (138, 227) to (252, 5) then Sets a single black pixel at (382, 211).
; PLAN: r0=428(x), r1=103(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=227(y1), r7=252(x2), r8=5(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=211(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 428
LDI r1, 103
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 227
LDI r7, 252
LDI r8, 5
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 211
LDI r12, 0x000000
PSET r10, r11, r12
HALT
