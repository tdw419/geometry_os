; DESCRIPTION: Composite: Places a black dot at position (139, 111) then Creates a green circular shape at (109, 125) with radius 58 then Draws a black line from (286, 128) to (223, 78).
; PLAN: r0=139(x), r1=111(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=125(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=128(y1), r12=223(x2), r13=78(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 111
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 125
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 128
LDI r12, 223
LDI r13, 78
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
