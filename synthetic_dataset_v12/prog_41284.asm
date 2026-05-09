; DESCRIPTION: Composite: Renders a green line between points (130, 170) and (433, 4) then Places a orange dot at position (453, 59) then Draws a yellow circle centered at (122, 141) with radius 39.
; PLAN: r0=130(x1), r1=170(y1), r2=433(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=141(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 170
LDI r2, 433
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 122
LDI r11, 141
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
