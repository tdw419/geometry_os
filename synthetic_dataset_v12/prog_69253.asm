; DESCRIPTION: Composite: Places a orange line segment connecting (427, 10) to (112, 83) then Places a green dot at position (402, 6) then Places a green circle of radius 67 at center (168, 71).
; PLAN: r0=427(x1), r1=10(y1), r2=112(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=6(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=71(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 10
LDI r2, 112
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 6
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 168
LDI r11, 71
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
