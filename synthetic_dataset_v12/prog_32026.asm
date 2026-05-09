; DESCRIPTION: Composite: Creates a orange circular shape at (253, 112) with radius 46 then Sets a single black pixel at (43, 242) then Draws a white line from (441, 14) to (244, 116).
; PLAN: r0=253(x), r1=112(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=242(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=441(x1), r11=14(y1), r12=244(x2), r13=116(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 112
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 242
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 441
LDI r11, 14
LDI r12, 244
LDI r13, 116
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
