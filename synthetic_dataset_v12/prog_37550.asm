; DESCRIPTION: Composite: Places a magenta dot at position (372, 106) then Places a green circle of radius 49 at center (136, 123) then Draws a white line from (136, 203) to (459, 65).
; PLAN: r0=372(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=123(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x1), r11=203(y1), r12=459(x2), r13=65(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 123
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 203
LDI r12, 459
LDI r13, 65
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
