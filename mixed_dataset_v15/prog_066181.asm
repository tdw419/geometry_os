; DESCRIPTION: Composite: Renders a blue line between points (41, 4) and (415, 255) then Places a orange dot at position (166, 242) then Draws a blue circle centered at (216, 146) with radius 17.
; PLAN: r0=41(x1), r1=4(y1), r2=415(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=216(x), r11=146(y), r12=17(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 4
LDI r2, 415
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 216
LDI r11, 146
LDI r12, 17
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
