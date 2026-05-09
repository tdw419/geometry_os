; DESCRIPTION: Composite: Places a purple line segment connecting (466, 183) to (23, 31) then Places a green dot at position (501, 132) then Renders a red disk with center (190, 129) and radius 62.
; PLAN: r0=466(x1), r1=183(y1), r2=23(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=129(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 183
LDI r2, 23
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 190
LDI r11, 129
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
