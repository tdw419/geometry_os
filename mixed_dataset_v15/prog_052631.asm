; DESCRIPTION: Composite: Renders a red line between points (442, 159) and (26, 44) then Places a yellow dot at position (381, 3) then Creates a red rectangular region at (393, 32) spanning 105 by 73 pixels.
; PLAN: r0=442(x1), r1=159(y1), r2=26(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=3(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=32(y), r12=105(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 159
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 3
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 393
LDI r11, 32
LDI r12, 105
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
