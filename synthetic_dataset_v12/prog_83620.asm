; DESCRIPTION: Composite: Draws a blue circle centered at (73, 167) with radius 10 then Sets a single blue pixel at (141, 119) then Renders a cyan line between points (203, 93) and (114, 148).
; PLAN: r0=73(x), r1=167(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=203(x1), r11=93(y1), r12=114(x2), r13=148(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 167
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 93
LDI r12, 114
LDI r13, 148
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
