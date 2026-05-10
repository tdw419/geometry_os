; DESCRIPTION: Composite: Draws a white circle centered at (209, 174) with radius 55 then Places a purple dot at position (195, 195) then Places a blue line segment connecting (97, 32) to (141, 38).
; PLAN: r0=209(x), r1=174(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=195(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=97(x1), r11=32(y1), r12=141(x2), r13=38(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 174
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 195
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 97
LDI r11, 32
LDI r12, 141
LDI r13, 38
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
