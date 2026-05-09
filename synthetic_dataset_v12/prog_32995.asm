; DESCRIPTION: Composite: Draws a orange circle centered at (268, 149) with radius 71 then Sets a single black pixel at (289, 231) then Draws a blue line from (343, 146) to (482, 125).
; PLAN: r0=268(x), r1=149(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=231(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=343(x1), r11=146(y1), r12=482(x2), r13=125(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 231
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 343
LDI r11, 146
LDI r12, 482
LDI r13, 125
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
