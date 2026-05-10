; DESCRIPTION: Composite: Places a blue 107x55 rectangle at position (97, 143) then Places a black dot at position (227, 98) then Renders a red disk with center (106, 50) and radius 43.
; PLAN: r0=97(x), r1=143(y), r2=107(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=98(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=50(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 143
LDI r2, 107
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 98
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 106
LDI r11, 50
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
