; DESCRIPTION: Composite: Renders a green disk with center (172, 72) and radius 66 then Places a white dot at position (181, 33) then Draws a black line from (334, 17) to (149, 121).
; PLAN: r0=172(x), r1=72(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=33(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=334(x1), r11=17(y1), r12=149(x2), r13=121(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 72
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 33
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 17
LDI r12, 149
LDI r13, 121
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
