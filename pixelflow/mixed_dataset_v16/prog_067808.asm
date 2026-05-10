; DESCRIPTION: Composite: Draws a green circle centered at (154, 163) with radius 43 then Places a green dot at position (73, 235) then Renders a yellow line between points (96, 123) and (463, 225).
; PLAN: r0=154(x), r1=163(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=123(y1), r12=463(x2), r13=225(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 163
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 96
LDI r11, 123
LDI r12, 463
LDI r13, 225
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
