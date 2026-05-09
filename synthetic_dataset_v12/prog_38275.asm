; DESCRIPTION: Composite: Sets a single black pixel at (412, 23) then Draws a white circle centered at (483, 226) with radius 14 then Renders a blue line between points (254, 64) and (471, 72).
; PLAN: r0=412(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=483(x), r6=226(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x1), r11=64(y1), r12=471(x2), r13=72(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 226
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 64
LDI r12, 471
LDI r13, 72
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
