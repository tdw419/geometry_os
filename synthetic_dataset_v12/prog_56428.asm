; DESCRIPTION: Composite: Draws a blue line from (148, 50) to (252, 137) then Sets a single cyan pixel at (364, 62) then Renders a magenta disk with center (458, 189) and radius 34.
; PLAN: r0=148(x1), r1=50(y1), r2=252(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=458(x), r11=189(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 50
LDI r2, 252
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 458
LDI r11, 189
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
