; DESCRIPTION: Composite: Draws a white line from (73, 253) to (320, 13) then Places a blue dot at position (339, 92) then Renders a orange disk with center (438, 169) and radius 44.
; PLAN: r0=73(x1), r1=253(y1), r2=320(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=169(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 253
LDI r2, 320
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 169
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
