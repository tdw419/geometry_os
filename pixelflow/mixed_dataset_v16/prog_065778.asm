; DESCRIPTION: Composite: Places a white circle of radius 66 at center (441, 69) then Places a black line segment connecting (131, 185) to (249, 6) then Sets a single black pixel at (367, 95).
; PLAN: r0=441(x), r1=69(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=185(y1), r7=249(x2), r8=6(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=95(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 69
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 185
LDI r7, 249
LDI r8, 6
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 95
LDI r12, 0x000000
PSET r10, r11, r12
HALT
