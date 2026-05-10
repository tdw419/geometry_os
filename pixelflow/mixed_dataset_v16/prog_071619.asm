; DESCRIPTION: Composite: Places a red line segment connecting (315, 249) to (88, 130) then Sets a single white pixel at (463, 171) then Draws a red circle centered at (180, 66) with radius 39.
; PLAN: r0=315(x1), r1=249(y1), r2=88(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=171(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=66(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 249
LDI r2, 88
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 171
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 66
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
