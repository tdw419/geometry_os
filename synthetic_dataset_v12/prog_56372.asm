; DESCRIPTION: Composite: Draws a white circle centered at (226, 173) with radius 73 then Renders a blue line between points (387, 101) and (237, 181) then Sets a single magenta pixel at (378, 181).
; PLAN: r0=226(x), r1=173(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x1), r6=101(y1), r7=237(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=181(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 173
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 101
LDI r7, 237
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 181
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
