; DESCRIPTION: Composite: Renders a black line between points (276, 211) and (8, 173) then Places a blue dot at position (211, 244) then Draws a cyan circle centered at (372, 73) with radius 68.
; PLAN: r0=276(x1), r1=211(y1), r2=8(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=244(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=372(x), r11=73(y), r12=68(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 211
LDI r2, 8
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 244
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 372
LDI r11, 73
LDI r12, 68
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
