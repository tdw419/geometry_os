; DESCRIPTION: Composite: Draws a green circle centered at (147, 160) with radius 22 then Places a blue dot at position (213, 184) then Places a blue line segment connecting (308, 172) to (411, 211).
; PLAN: r0=147(x), r1=160(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=184(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=308(x1), r11=172(y1), r12=411(x2), r13=211(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 160
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 184
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 172
LDI r12, 411
LDI r13, 211
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
