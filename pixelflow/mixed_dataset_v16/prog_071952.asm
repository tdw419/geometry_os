; DESCRIPTION: Composite: Draws a black line from (60, 21) to (165, 23) then Creates a cyan circular shape at (489, 199) with radius 22 then Places a black dot at position (368, 159).
; PLAN: r0=60(x1), r1=21(y1), r2=165(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=199(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=159(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 21
LDI r2, 165
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 199
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 159
LDI r12, 0x000000
PSET r10, r11, r12
HALT
