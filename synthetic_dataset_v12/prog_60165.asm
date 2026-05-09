; DESCRIPTION: Composite: Places a green dot at position (153, 112) then Draws a black line from (482, 32) to (255, 17) then Creates a blue circular shape at (287, 159) with radius 34.
; PLAN: r0=153(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=32(y1), r7=255(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=159(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 482
LDI r6, 32
LDI r7, 255
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 159
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
