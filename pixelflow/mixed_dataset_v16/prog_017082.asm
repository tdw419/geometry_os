; DESCRIPTION: Composite: Draws a orange circle centered at (93, 159) with radius 76 then Sets a single white pixel at (300, 35) then Places a white line segment connecting (69, 101) to (487, 128).
; PLAN: r0=93(x), r1=159(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=35(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=69(x1), r11=101(y1), r12=487(x2), r13=128(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 159
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 35
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 69
LDI r11, 101
LDI r12, 487
LDI r13, 128
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
