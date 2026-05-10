; DESCRIPTION: Composite: Places a blue dot at position (444, 67) then Places a cyan line segment connecting (408, 160) to (169, 24) then Creates a yellow circular shape at (415, 103) with radius 67.
; PLAN: r0=444(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=160(y1), r7=169(x2), r8=24(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=103(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 160
LDI r7, 169
LDI r8, 24
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 103
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
