; DESCRIPTION: Composite: Places a magenta line segment connecting (198, 116) to (65, 157) then Places a cyan dot at position (76, 165) then Creates a orange circular shape at (230, 169) with radius 11.
; PLAN: r0=198(x1), r1=116(y1), r2=65(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=165(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=169(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 116
LDI r2, 65
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 165
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 230
LDI r11, 169
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
