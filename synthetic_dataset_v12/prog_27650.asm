; DESCRIPTION: Composite: Renders a red line between points (165, 217) and (72, 85) then Creates a yellow circular shape at (201, 210) with radius 18 then Places a green dot at position (322, 244).
; PLAN: r0=165(x1), r1=217(y1), r2=72(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=210(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=244(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 217
LDI r2, 72
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 210
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 244
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
