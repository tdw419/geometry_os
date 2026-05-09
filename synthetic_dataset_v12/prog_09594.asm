; DESCRIPTION: Composite: Draws a green circle centered at (75, 92) with radius 27 then Sets a single black pixel at (321, 224) then Renders a yellow line between points (469, 121) and (177, 75).
; PLAN: r0=75(x), r1=92(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=224(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=469(x1), r11=121(y1), r12=177(x2), r13=75(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 92
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 224
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 469
LDI r11, 121
LDI r12, 177
LDI r13, 75
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
