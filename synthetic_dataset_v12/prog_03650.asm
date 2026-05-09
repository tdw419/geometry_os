; DESCRIPTION: Composite: Renders a white line between points (323, 16) and (49, 209) then Places a green dot at position (438, 148) then Draws a green circle centered at (99, 85) with radius 18.
; PLAN: r0=323(x1), r1=16(y1), r2=49(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=148(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=85(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 16
LDI r2, 49
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 148
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 99
LDI r11, 85
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
