; DESCRIPTION: Composite: Renders a yellow line between points (2, 34) and (286, 230) then Places a orange dot at position (130, 225) then Places a magenta circle of radius 62 at center (402, 133).
; PLAN: r0=2(x1), r1=34(y1), r2=286(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=225(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=133(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 34
LDI r2, 286
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 225
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 402
LDI r11, 133
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
