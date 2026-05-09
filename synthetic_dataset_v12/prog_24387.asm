; DESCRIPTION: Composite: Draws a yellow circle centered at (439, 166) with radius 55 then Sets a single white pixel at (499, 112) then Draws a orange line from (474, 53) to (97, 189).
; PLAN: r0=439(x), r1=166(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=474(x1), r11=53(y1), r12=97(x2), r13=189(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 166
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 53
LDI r12, 97
LDI r13, 189
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
