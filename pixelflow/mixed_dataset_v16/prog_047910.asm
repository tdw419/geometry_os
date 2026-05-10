; DESCRIPTION: Composite: Renders a black line between points (72, 238) and (450, 51) then Creates a purple circular shape at (163, 54) with radius 18 then Places a orange dot at position (217, 17).
; PLAN: r0=72(x1), r1=238(y1), r2=450(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=54(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=17(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 238
LDI r2, 450
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 54
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 17
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
