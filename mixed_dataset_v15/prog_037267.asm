; DESCRIPTION: Composite: Draws a orange circle centered at (89, 174) with radius 72 then Places a magenta dot at position (390, 24) then Places a cyan line segment connecting (148, 9) to (113, 188).
; PLAN: r0=89(x), r1=174(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=24(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=148(x1), r11=9(y1), r12=113(x2), r13=188(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 174
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 24
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 148
LDI r11, 9
LDI r12, 113
LDI r13, 188
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
