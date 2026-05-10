; DESCRIPTION: Composite: Places a yellow line segment connecting (189, 158) to (399, 208) then Places a orange dot at position (260, 49) then Renders a cyan disk with center (69, 190) and radius 56.
; PLAN: r0=189(x1), r1=158(y1), r2=399(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=190(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 158
LDI r2, 399
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 69
LDI r11, 190
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
