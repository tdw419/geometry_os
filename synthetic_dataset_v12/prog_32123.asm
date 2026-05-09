; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (235, 164) then Sets a single white pixel at (268, 10) then Places a orange line segment connecting (275, 126) to (436, 25).
; PLAN: r0=235(x), r1=164(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=10(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=275(x1), r11=126(y1), r12=436(x2), r13=25(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 164
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 10
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 126
LDI r12, 436
LDI r13, 25
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
