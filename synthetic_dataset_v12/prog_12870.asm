; DESCRIPTION: Composite: Renders a orange line between points (286, 46) and (210, 223) then Creates a green circular shape at (347, 123) with radius 64 then Places a purple dot at position (249, 121).
; PLAN: r0=286(x1), r1=46(y1), r2=210(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=123(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x), r11=121(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 46
LDI r2, 210
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 123
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 121
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
