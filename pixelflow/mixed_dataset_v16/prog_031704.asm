; DESCRIPTION: Composite: Places a yellow dot at position (86, 31) then Draws a orange circle centered at (54, 199) with radius 43 then Draws a blue line from (437, 194) to (54, 101).
; PLAN: r0=86(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=199(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x1), r11=194(y1), r12=54(x2), r13=101(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 54
LDI r6, 199
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 194
LDI r12, 54
LDI r13, 101
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
