; DESCRIPTION: Composite: Renders a magenta disk with center (81, 156) and radius 80 then Places a orange dot at position (17, 44) then Draws a black line from (257, 205) to (54, 149).
; PLAN: r0=81(x), r1=156(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=44(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=257(x1), r11=205(y1), r12=54(x2), r13=149(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 156
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 44
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 257
LDI r11, 205
LDI r12, 54
LDI r13, 149
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
