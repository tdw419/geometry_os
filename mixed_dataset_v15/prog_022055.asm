; DESCRIPTION: Composite: Draws a orange line from (82, 192) to (148, 250) then Creates a blue circular shape at (310, 83) with radius 73 then Places a black dot at position (281, 203).
; PLAN: r0=82(x1), r1=192(y1), r2=148(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=83(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=203(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 192
LDI r2, 148
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 83
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 203
LDI r12, 0x000000
PSET r10, r11, r12
HALT
