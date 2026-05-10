; DESCRIPTION: Composite: Places a purple dot at position (249, 36) then Places a blue line segment connecting (436, 155) to (103, 164) then Creates a white circular shape at (457, 129) with radius 17.
; PLAN: r0=249(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=155(y1), r7=103(x2), r8=164(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=129(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 155
LDI r7, 103
LDI r8, 164
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 129
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
