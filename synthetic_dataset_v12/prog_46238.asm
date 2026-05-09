; DESCRIPTION: Composite: Sets a single magenta pixel at (194, 187) then Draws a green circle centered at (147, 149) with radius 38 then Draws a magenta line from (171, 45) to (313, 255).
; PLAN: r0=194(x), r1=187(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=149(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x1), r11=45(y1), r12=313(x2), r13=255(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 187
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 149
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 45
LDI r12, 313
LDI r13, 255
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
