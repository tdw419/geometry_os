; DESCRIPTION: Composite: Places a black dot at position (397, 5) then Draws a white circle centered at (376, 84) with radius 33 then Places a white line segment connecting (142, 123) to (145, 5).
; PLAN: r0=397(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=84(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x1), r11=123(y1), r12=145(x2), r13=5(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 376
LDI r6, 84
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 123
LDI r12, 145
LDI r13, 5
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
