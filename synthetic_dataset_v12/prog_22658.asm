; DESCRIPTION: Composite: Renders a red line between points (291, 181) and (105, 230) then Draws a blue circle centered at (132, 72) with radius 44 then Sets a single black pixel at (380, 233).
; PLAN: r0=291(x1), r1=181(y1), r2=105(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=72(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=233(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 181
LDI r2, 105
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 72
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 233
LDI r12, 0x000000
PSET r10, r11, r12
HALT
