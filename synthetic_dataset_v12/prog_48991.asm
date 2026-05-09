; DESCRIPTION: Composite: Places a yellow line segment connecting (81, 186) to (142, 255) then Places a green dot at position (436, 93) then Draws a blue circle centered at (38, 227) with radius 13.
; PLAN: r0=81(x1), r1=186(y1), r2=142(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=93(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=227(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 186
LDI r2, 142
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 93
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 38
LDI r11, 227
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
