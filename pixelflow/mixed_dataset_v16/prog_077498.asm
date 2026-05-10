; DESCRIPTION: Composite: Renders a yellow disk with center (206, 132) and radius 62 then Sets a single blue pixel at (310, 163) then Places a red line segment connecting (189, 207) to (456, 165).
; PLAN: r0=206(x), r1=132(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=189(x1), r11=207(y1), r12=456(x2), r13=165(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 132
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 189
LDI r11, 207
LDI r12, 456
LDI r13, 165
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
