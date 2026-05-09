; DESCRIPTION: Composite: Places a yellow dot at position (272, 42) then Draws a orange circle centered at (101, 101) with radius 76 then Draws a red line from (51, 29) to (235, 197).
; PLAN: r0=272(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=101(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=51(x1), r11=29(y1), r12=235(x2), r13=197(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 101
LDI r6, 101
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 51
LDI r11, 29
LDI r12, 235
LDI r13, 197
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
