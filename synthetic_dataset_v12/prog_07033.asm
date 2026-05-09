; DESCRIPTION: Composite: Places a black dot at position (346, 20) then Draws a white circle centered at (463, 85) with radius 11 then Renders a black line between points (342, 30) and (172, 116).
; PLAN: r0=346(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=85(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=30(y1), r12=172(x2), r13=116(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 463
LDI r6, 85
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 30
LDI r12, 172
LDI r13, 116
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
