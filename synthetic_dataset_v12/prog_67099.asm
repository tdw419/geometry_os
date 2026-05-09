; DESCRIPTION: Composite: Renders a green line between points (407, 46) and (318, 7) then Draws a green circle centered at (387, 88) with radius 29 then Places a red dot at position (316, 66).
; PLAN: r0=407(x1), r1=46(y1), r2=318(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=88(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=66(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 46
LDI r2, 318
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 88
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 66
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
