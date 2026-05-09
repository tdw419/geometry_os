; DESCRIPTION: Composite: Places a white dot at position (100, 207) then Creates a blue circular shape at (280, 136) with radius 29 then Draws a orange line from (153, 31) to (190, 98).
; PLAN: r0=100(x), r1=207(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=136(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x1), r11=31(y1), r12=190(x2), r13=98(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 207
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 136
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 31
LDI r12, 190
LDI r13, 98
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
