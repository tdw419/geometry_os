; DESCRIPTION: Composite: Places a black line segment connecting (465, 9) to (262, 155) then Creates a yellow circular shape at (50, 27) with radius 24 then Places a red dot at position (408, 51).
; PLAN: r0=465(x1), r1=9(y1), r2=262(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=27(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=51(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 9
LDI r2, 262
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 27
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 51
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
